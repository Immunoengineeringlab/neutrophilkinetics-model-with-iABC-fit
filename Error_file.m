function [RMSD] = Error_file(parameters)

%===============================================
% data%===============================================
% %saline mean
tptvals=[33.16,58.22857143,35.96,20.555,6.665,1.175,1.08       %bone marrow
    ;3.298,19.36142857,57.98,45.1,13.78,1.5525,2.4             %blood
    ;1.78,12.06142857,42.42,35.46666667,11.53,4.975,1.6575];   %peritoneum

% %saline standard deviations
standard=[8.37275343,7.787749843,11.06494465,7.329594122,7.704707003,0.862187141,0.929874544  %bone marrow
    ;2.69389495,18.67953642,8.302228616,13.54518365,8.847734173,1.315405514,2.963252717       %blood
    ;1.522120232,7.856251075,2.338161671,11.7607256,6.415225639,3.380271192,1.04442568];      %peritoneum

data = tptvals;
%get parameters____________________________________________________________
inipar = 10.^parameters;
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



%extracting data___________________________________________________________


mature=y(:,2+n:2+n+h);
y2=sum(mature,2);
y3=y(:,3+n+h);
y4=y(:,4+n+h);

tpts=[24 48 72 96 120 144 168];

tptvals=data;

%calculating RMSD__________________________________________________________
p1=interp1(t,y2,tpts);
p2=interp1(t,y3,tpts);
p3=interp1(t,y4,tpts);

 RMSD=sum( ((p1-tptvals(1,:))./standard(1,:)).^2     +   ((p2-tptvals(2,:))./standard(2,:)).^2   +     ((p3-tptvals(3,:))./standard(3,:)).^2);
    
end