% use this script to make files for analysis. Before running this script,
% create an empty folder where the data will be saved. 

%unfinished and developmental only

clear
close all
clc

save_folder = uigetdir('' , 'Select folder to save data');

import_arrays = str2num(cell2mat(inputdlg('Enter the number of arrays to import')));

[import_file , import_path] = uigetfile('*.*' , 'Select file to import data');
cd(import_path)
for stepper = 1:import_arrays;
    file_nm = inputdlg('Enter the file name you want to use for the data'); %% takes input of name for array and assigned it dlg_nm
    file_nm = char(file_nm); %% turns dlg_nm into a text scalar
    imported_data = uiimport(import_file); 
    cd(save_folder)
    save(file_nm , 'imported_data');
    cd(import_path)
end
