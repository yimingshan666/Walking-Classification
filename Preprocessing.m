% Pay attention to filename letter case! don't get it wrong again!!
rawfilelist=dir('*.mat');
for i=1:numel(rawfilelist)
    load(rawfilelist(i).name);
    data=Acceleration(601:end-600,:);%60Hz × 10seconds = 600
    len=length(data.X);
    time=linspace(0,len/60,len);
    data=table2array(data)';
    if contains(rawfilelist(i).name,'s')
        newfilename=strcat('E:\Monty_Matlab_SS2021-main\62999\','Group1_Walk',num2str(i),'_S.mat');
    else
        newfilename=strcat('E:\Monty_Matlab_SS2021-main\62999\','Group1_Walk',num2str(i),'_N.mat');
    end
    save(newfilename,'data','time');
end

