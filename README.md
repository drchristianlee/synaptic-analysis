# synaptic-analysis
 
Creating .mat files containing data to use. 
- First create a directory (folder) where you want to save the files. Then use make_files.m to create the variable files for use by importing them from an excel    sheet. You will first be prompted to select the folder where you want to save the files. 

- Secondly, you will be prompted to how many variables you want to import.
    Note: You may import many arrays into a .mat file. Be aware of what is needed for each script. 
    i.e. bar_graph, two variables one for each bar; heat_map, one variable with both textdata and data
    
- Thirdly, you will be prompted to select the file to import from, then name each the respective file for the variable, then select the data from the file to import to the file. This step will repeat depending on the number of variables wanting to input.
    Note: Selecting data from a spreadsheet, first select the sheet, then select the variable to import.

# bar_graphs
Creating .mat files containing data to use. 
- Use make_files.m to create the variable files. For bar_graphs, when selecting data from a spreadsheet for the varialable files. One variable (numberdata) is needed for each bar, two variables in totals.

Use bar_graphs script to create two bar graphs with a paired or unpaired test.
- First, run the script. You will be prompted to select the folder where your variables are located. The script will pull the two variables created for creating the bar graphs.

- Secondly, you will be prompted on what test you would like to run: 1, paired; 2, unpaired

- Lastly, a dialog box with prompt you to enter in axis & bar labels respectively. 
         

# heat_map
Creating .mat files containing data to use. 
- Use make_files.m to create the variable files for use of heat_map.m. For heat_map to use the variable file when selecting data from a spreadsheet have both        textdata and data selected. No need to create separate variables for each one. 

When selecting your data from a spreadsheet.
- Have the data (numbers and text) in the order you would want them to be displayed and have only the data you want to use in a separate sheet (i.e. no other numbers or text that could be selected). For row and column names, keep each label aligned with each row and column. The cell, 1,1 or 1,A, will be excluded when pulling the names.
    Note: for X and Y text labels, there should be no duplicates i.e "A, A, A, ... " but "A1, A2, A3, ..."

Use heat_map script to create the heatmap.
- Once variable files are made, prompts will appear to indicate what you are selecting for. Once selected, a dialog box will appear to allow you to enter axis labels as well as a title. The last line of code in heat_map script is what determine the color, the link to the color schemes are commented, change the name after the "=" to change the color scheme to your liking.
