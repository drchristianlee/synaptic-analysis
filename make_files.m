% Use this script to make files for analysis. Before running this script, create an empty folder where the data will be saved. 
% Secondly, you will be prompted to how many variables you want to import.
%    Note: You may import many arrays into a .mat file. Be aware of what is needed for each script. 
%    i.e. bar_graph, two variables one for each bar; heat_map, one variable with both textdata and data   
% Lastly, you will be prompted to select the file to import from, name each respective file for the variable, then select the data to import to the file. 
% This step will repeat depending on the number of variables wanting to input.
%    Note: Selecting data from a spreadsheet, first select the sheet, then select the variable to import.

clear
close all
clc

save_folder = uigetdir('' , 'Select folder to save data');

import_arrays = str2num(cell2mat(inputdlg('Enter the number of variables to import')));

[import_file , import_path] = uigetfile('*.*' , 'Select file to import data');
cd(import_path)
for stepper = 1:import_arrays;
    file_nm = inputdlg('Enter the file name you want to use for the data');
    file_nm = char(file_nm);
    imported_data = uiimport(import_file); 
    cd(save_folder)
    save(file_nm , 'imported_data');
    cd(import_path)
end
