[file_nm, path] = uigetfile;
cd(path);
imported_data = load(file_nm);

figure


histogram(imported_data.data(:,1));


histogram(imported_data.data(:,1),'Normalization','cdf')


% also https://www.mathworks.com/matlabcentral/answers/426214-how-to-plot-a-histogram-as-a-curve