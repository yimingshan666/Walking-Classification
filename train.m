%% training the net

function model = train(path_train, SamplingRate,WindowWidth)
XTrain=[];
YTrain=[];
Normalwalk_dataTest=[];
Sillywalkwalk1_dataTest=[];
Normalwalk_dataTest=[];
Sillywalkwalk1_dataTest=[];
name_list = dir(fullfile(path_train,'*.mat'));
len = length(name_list);
for i = 1:len
    file_name=name_list(i).name;
    X=[];
    Y=[];
    
    [X, Y] = extractData(1,file_name,SamplingRate,WindowWidth);
    XTrain=[XTrain;X];
    YTrain=[YTrain;Y];
        switch Y(1,1)
        case 'Normal walk'
            Normalwalk_dataTest=[Normalwalk_dataTest,XTrain{i,1}];
        case 'Silly walk'
            Sillywalkwalk1_dataTest=[Sillywalkwalk1_dataTest,XTrain{i,1}];
        % case ''
        end
end 

model = trainSillyWalkClassifier(XTrain, YTrain);

save('Model.mat','model');



Accx = 0; Accy = 0; Accz = 0;
Accx2 = 0; Accy2 = 0; Accz2 = 0;

% The three-axis acceleration above will participate in the plot as the y-axis;
% And in order to realize the dynamic effect, we need a variable to store the starting value of the coordinate area display
XAxis = 1; StartValue = 1;


% Accelerate Plot handles. Updating the data using the set function will increase the plotting speed
% global AccPlots 
l = min([length(Normalwalk_dataTest(1,:)),length(Sillywalkwalk1_dataTest(1,:))]);
AccFigure = figure('Name','Acc','NumberTitle','off');
AccFigure.Color = [1 1 1];
AccFigure.Position = [400 200 1200 700];
while (StartValue+300<=l)

subplot(2,1,1);
AccPlots = plot(XAxis,Accx,'r',...
    XAxis,Accy,'g', ...
    XAxis,Accz,'b');
legend(AccPlots,{'AccX','AccY','AccZ'});
% AccFigure2.Position = [400 200 1200 700];
axis([StartValue StartValue+300 -25 15]);
% AccFigure2.Position = [400 200 1200 700];
title('Normal Walk','fontname', 'times new roman','fontSize',18);
xlabel('Relative Time [s]','fontname', 'times new roman','fontSize',18);%设置坐标轴的标签字号大小(20)
ylabel('Acceleation [m/s^2]','fontname', 'times new roman','fontSize',18);
grid on

% AccFigure2 = figure('Name','Acc','NumberTitle','off');
% AccFigure2.Color = [1 1 1];
subplot(2,1,2);
AccPlots2 = plot(XAxis,Accx2,'r',...
    XAxis,Accy2,'g', ...
    XAxis,Accz2,'b');
legend(AccPlots2,{'AccX','AccY','AccZ'});
axis([StartValue StartValue+300 -25 15]);
% AccFigure2.Position = [400 200 1200 700];
title('Silly Walk','fontname', 'times new roman','fontSize',18);
xlabel('Relative Time [s]','fontname', 'times new roman','fontSize',18);
ylabel('Acceleation [m/s^2]','fontname', 'times new roman','fontSize',18);
grid on

      XAxis=[StartValue:StartValue+300];
      Accx = Normalwalk_dataTest(1,StartValue:StartValue+300);
      Accy = Normalwalk_dataTest(2,StartValue:StartValue+300);
      Accz = Normalwalk_dataTest(3,StartValue:StartValue+300);
      Accx2 = Sillywalkwalk1_dataTest(1,StartValue:StartValue+300);
      Accy2 = Sillywalkwalk1_dataTest(2,StartValue:StartValue+300);
      Accz2 = Sillywalkwalk1_dataTest(3,StartValue:StartValue+300);
      % AccFigure.Children(2).XLim = [StartValue, StartValue+300];
      % XLim = [1 StartValue+10];
            % Use the set function to update the data of the plot handle created at the beginning of the script.
            % set(AccPlots(1),"XData",XAxis,"YData",Accx);
            % set(AccPlots(2),"XData",XAxis,"YData",Accy);
            % set(AccPlots(3),"XData",XAxis,"YData",Accz);
            % % xlim([StartValue StartValue+300]);
            % set(AccPlots2(1),"XData",XAxis,"YData",Accx2);
            % set(AccPlots2(2),"XData",XAxis,"YData",Accy2);
            % set(AccPlots2(3),"XData",XAxis,"YData",Accz2);
            % xlim([StartValue StartValue+300]);
            drawnow;
      
      StartValue = StartValue+1;
      pause(0.0001);
end

end

