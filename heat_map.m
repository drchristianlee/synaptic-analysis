% Creates a heatmap from files you create in make_files.m
% You should have 1 file to use with your data and datatext. 

clear;
close all
clc
  
uiwait(msgbox('Select folder to save data'));
save_folder = uigetdir('' , 'Select folder to save data'); % Selects save folder
cd(save_folder)

uiwait(msgbox('Select data for heat map','modal')); % Selects heat map data
file_nm = uigetfile();
load(file_nm)
table = struct2cell(imported_data);

axis = table{2,1};
xvalues = axis(1,2:width(axis));
yvalues = axis(2:height(axis),1);
table = table{1,1};

dlg_ans  = inputdlg({'What is your graph title?','What is your x-axis representing?', 'What is your y-axis representing?'});

map = heatmap(xvalues, yvalues, table);
map.Title = dlg_ans(1,1);
map.XLabel = dlg_ans(2,1);
map.YLabel = dlg_ans(3,1);
map.Colormap = winter; % https://www.mathworks.com/help/matlab/ref/colormap.html
