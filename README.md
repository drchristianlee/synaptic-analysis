# synaptic-analysis
 
Create .mat files containing the results. First create a directory where
you want to save the files. Then create a variable to hold each set of
values. Results are organized in .mat files with data in column so copy
paste values as column vectors. Then, change to the directory where you
want to save the data and save the variables using save('variable_name.mat', 'variable_name').

# heatmap
Creating .mat files containing the results. 
    First, create a folder where you want to save the files. Use make_files.m to create the variable files for use of heat_map.m. For heat_map to use the variable
    file when selecting data from a spreadsheet have both textdata and data selected. No need to create separate arrays for each one. 

When selecting your data from a spreadsheet have data in the order you would want them to be displayed and only data (numbers and text) points you want to use in sheet (i.e. no other numbers are text that could be selected). For row and column names, do not worry about trying to shift names, keep each label aligned with each row and column. The cell, 1,1 or 1,A, will be excluded when pulling the names.

Once variable files are made, use heat_map script to create the heatmap. Prompts will appear to indicate what you are selecting for. Once selected, a dialog box will appear to allow you to enter axis labels as well as a title. The last line of code in heat_map script is what determine the color, the link to the color schemes are commented, change the name after the "=" to change the color scheme to your liking.
