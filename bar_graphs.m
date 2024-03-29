% Creates two bar graphs from files you created. Files can be created from
% make_files.m or using another method. Values are entered as column
% vectors. 
% You should have 2 files to use with your data, one for each bar.
% Note: only files for the two variables should be in the folder this
% script is run on
% Run this script
%    First, you will select your designated folder with the 2 variables and it will pull them from the folder. 
%    Second, you will select your test, paired or unpaired. 
%    Lastly, you will be prompted to fill in labels for your axis, bar, and title. 




clear;
close all
clc

holdercells = load_mat_files

test = str2num(cell2mat(inputdlg('Would you like to do a paired or unpaired test? Press 1 for paired 2 for unpaired')));
cust_label = str2num(cell2mat(inputdlg('Would you like to add custom labels? Press 1 for yes 2 for no')));

%uncomment below if make_files was used
% for f = 1:count; %% transverses holdercells struct type to cell type
%     holdercells(1,f) = struct2cell(holdercells{1,f});
% end

for subs = 1:size(holdercells, 2);
    for frames = 1:size(holdercells{1, subs}, 1);
        test_keeper(frames, subs) = holdercells{1, subs}(frames, 1);
    end
end


scale = 0; %enter 1 to scale data by 1000 else 0

test_keeper(test_keeper == 0) = NaN;

if scale == 1;
    test_keeper = test_keeper * 1000;
else
end

barkeeper(1,1) = mean(test_keeper(:,1), 'omitnan');
barkeeper(1,2) = mean(test_keeper(:, 2), 'omitnan');
nanfinder = isnan(test_keeper);
nanvals = sum(nanfinder, 1);
denominator1 = sqrt((size(test_keeper(:, 1), 1)) - nanvals(1, 1));
denominator2 = sqrt((size(test_keeper(:, 2), 1)) - nanvals(1, 2));
barkeeper(2,1) = std(test_keeper(:,1), 'omitnan')/denominator1;
barkeeper(2,2) = std(test_keeper(:,2), 'omitnan')/denominator2;

figure
bar(barkeeper(1,:), 'FaceColor', [0.99 0.99 0.99], 'EdgeColor', [0.0 0.0 0.0], 'LineWidth', 1.5); % vertical bar chart, white bar/black outline/thickend outline
hold on;
errorbar(barkeeper(1,:), barkeeper(2,:), '.', 'color', 'k', 'marker', 'none');
hold on;

if test == 1;
    for points = 1:size(test_keeper, 1);
        plot(test_keeper(points, 1:2) , '-o', 'color' , 'black', 'MarkerFaceColor', 'green') % sets column 2 points with green colors
        plot(test_keeper(points, 1:1) , '-o', 'color' , 'black', 'MarkerFaceColor', 'red')   % sets column 1 points with red colors
        hold on                                                                              % black sets connecting lines as black between points
    end                                                                                      % must have 1:2 then 1:1 being that this is a loop, the 1:1 after 1:2 covers all column 1's points with different colors
elseif test == 2;
    for points = 1:size(test_keeper, 1);
        plot(test_keeper(points, 1:2) , 'o', 'color' , 'green', 'MarkerFaceColor', 'green') % sets column 2 points with green colors
        plot(test_keeper(points, 1:1) , 'o', 'color' , 'red', 'MarkerFaceColor', 'red')     % sets column 1 points with red colors
        hold on                                                                             % must have 1:2 then 1:1 being that this is a loop the 1:1 after 1:2 covers all column 1's points with different colors
    end
end
  
 
 % sets axis & bars labels 
 if cust_label == 1;
 dlg_ans  = inputdlg({'What is your graph title?','What is your x-axis representing?', 'What is your y-axis representing?', 'What is your first bar representing?', 'What is your second bar representing?'});
 xlabel(dlg_ans(2,1))
 ylabel(dlg_ans(3,1))
 barnames = dlg_ans(4:5,1);
 set(gca,'xticklabel',barnames)
 title(dlg_ans(1,1))
 else
 end

%  axis([0 3 0 700])
%  yticks([0:100:700])
 set(gca,'TickDir','out')
 set(gca, 'box', 'off')
 set(gcf,'position',[680 558 160 210])
 set(gca, 'TickLength', [0.025 0.025]);
 set(gca,'FontSize',9);
 
 if test == 1;
 [h p ci stats] = ttest(test_keeper(:, 1), test_keeper(:, 2))
 disp('a paired test was used');
 else
     [h p ci stats] = ttest2(test_keeper(:, 1), test_keeper(:, 2))
     disp('an unpaired test was used');
 end
