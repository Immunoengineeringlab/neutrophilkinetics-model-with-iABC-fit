%This code plots the histograms one over the other (stacked not overlapped) as shown
%in the paper. Once matlab figure is displayed, export it to the desired resolution

figure
%load the data files obtained from runnung the "run_this.m"
A=load('session_main_LH_EDUTOTAL_ALGINATE');
parameterss.alg=A.PRM_nest;
A=load('session_main_LH_EDUTOTAL_CHITOSAN');
parameterss.chi=A.PRM_nest;
A=load('session_main_LH_EDUTOTAL_SALINE');
parameterss.sal=A.PRM_nest;

%specify colours for different groups
salc=[0 0 0]/255;
chic=[230 125 50]/255;
algc=[0 158 115]/255;


group={'sal','chi','alg'};
groupc={'salc','chic','algc'};

for i=1:1:3
    
    subplot(3,1,i)
    %set(hh,'facealpha',0.35);
    los=eval(['parameterss.',group{i}]);
    
    logparameters=los(:,:,12); %here 12 refers to the final iteration (refer to "run_this.m" where we defined n_nest=12 in line 7) of iABC.
    
    parameters=10.^(logparameters);  %antilog values of parameters from the datafile
    
    V=parameters(:,8);               %parameter index (8 in this case) refers to distribution of which parameter is being plotted
    %to know which index corresponds to which parameter , please refer to the "Error_file.m"
    
    %V=((floor(parameters(:,7)))./parameters(:,6)); %corresponds to (h/s)
    
    [N,edges] = histcounts(V,40);
    %[N,edges] = histcounts(V, 'Normalization','pdf');
    edges = edges(2:end) - (edges(2)-edges(1))/2;
    % plot(edges, N,'r');
    hh=fill([0 edges edges(end)],[0 N 0],eval(groupc{i}));
    xlim([0 2])
    set(hh,'facealpha',1);
end