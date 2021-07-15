%To plot the sample curves around the mean along with the experimental data with error bars
%use same line widths and opacities as in this file and render to 800 while exporting
%for saline alone decrease opacity to 0.1


logparameters=PRM_nest(:,:,12);

PARAMETERS=10.^(logparameters);

%The following for loop loops through all the parameter sets from the data
%and generates time evolution of neutrophil percentages in different
%compartments and saves it in arrays
for q=1:1:1000
    
    inipar=PARAMETERS(q,:);
    
    n=floor(inipar(1));
    IC=inipar(2);
    U=inipar(3);
    R=inipar(4);
    R1=inipar(5);
    s=inipar(6);
    h=floor(inipar(7));
    w=inipar(8);
    inter1=zeros(1,n);
    inter2=zeros(1,h);
    
    
    %solving DDE_______________________________________________________________
    tspan = [0 180];
    y0 = [IC inter1 0 inter2 0 0];
    [t,y] = ode45(@(t,y) marrowwithdelay(t,y,n,U,R,R1,s,h,w), tspan, y0);
    
    tpts=[0:0.3:180];
    
    %extracting data___________________________________________________________
    
    immature=y(:,1:2+n-1);
    y1=sum(immature,2);
    y1=interp1(t,y1,tpts);
    mature=y(:,2+n:2+n+h);
    y2=sum(mature,2);
    y2=interp1(t,y2,tpts);
    y3=y(:,3+n+h);
    y3=interp1(t,y3,tpts);
    y4=y(:,4+n+h);
    y4=interp1(t,y4,tpts);
    
    Y=[y1;y2;y3;y4];
    X=t';
    curves{q}=Y;
    xcurves{q}=X;
    Y1(q,:)=y1;
    Y2(q,:)=y2;
    Y3(q,:)=y3;
    Y4(q,:)=y4;
    
end

%color codes for different groups is as shown below
% salc=[0 0 0]/255;
% chic=[230 125 50]/255;
% algc=[0 158 115]/255;

hold on

a1=[0 0 0]/255;
a2=[0 0 0]/255;
a3=[0 0 0]/255;
opacity=0.3;
xdata=[0:0.3:180];

%the following for loop goes through the generated time course data for all
%the parameter sets and plots it
% in the following loop Y1 corresponds to proliferation pool, Y2 to BM, Y3 to blood, Y4
% to peritoneum. while generating plots for different compartments make
% sure to comment and uncomment appropriate lines in the code (Here blood is
% being plotted)

for s=1:1:q
%     plot(xdata,Y1(s,:),'color',[a1 opacity],'LineWidth',0.02) %proliferation pool
%     plot(xdata,Y2(s,:),'color',[a1 opacity],'LineWidth',0.02) %maturation pool
     plot(xdata,Y3(s,:),'color',[a2 opacity],'LineWidth',0.02)  %blood
%     plot(xdata,Y4(s,:),'color',[a3 opacity],'LineWidth',0.02) %peritoneum
end

% calculate the time course of  mean values of plotted curves
my1=mean(Y1);
my2=mean(Y2);
my3=mean(Y3);
my4=mean(Y4);

% plot(xdata,my1,'color',a1*0.8,'LineWidth',2) %proliferation pool
% plot(xdata,my2,'color',a1*0.8,'LineWidth',2) %maturation pool
 plot(xdata,my3,'color',a2*0.8,'LineWidth',2)  %blood
% plot(xdata,my4,'color',a3*0.8,'LineWidth',2) %peritoneum

% upload appropriate data set here to overlay with the model curves
%saline mean
tptvals=[33.16,58.22857143,35.96,20.555,6.665,1.175,1.08       %bone marrow
    ;3.298,19.36142857,57.98,45.1,13.78,1.5525,2.4             %blood
    ;1.78,12.06142857,42.42,35.46666667,11.53,4.975,1.6575];   %peritoneum

% %saline standard deviations
sigmas=[8.37275343,7.787749843,11.06494465,7.329594122,7.704707003,0.862187141,0.929874544    %bone marrow
    ;2.69389495,18.67953642,8.302228616,13.54518365,8.847734173,1.315405514,2.963252717       %blood
    ;1.522120232,7.856251075,2.338161671,11.7607256,6.415225639,3.380271192,1.04442568];      %peritoneum

tpts=[24 48 72 96 120 144 168];

%note that there is no experimental data for proliferation pool therefore while plotting proliferation pool comment the rest of the script till line 117
% The data
qq = tptvals(2,:); %here (2,:) says that experimental data of blood is being overlayed with model curves. 1-bonemarrow 2-blood 3-peritoneum
% The standard deviations
E = sigmas(2,:);
% Mean values with error bars
errorbar(tpts,qq,E,'x')

% line width for error bars is 2 cap size is 8 marker size 6 and marker style is 'o'