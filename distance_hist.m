[file_nm, path] = uigetfile;
cd(path);
load(file_nm);

figure

histogram(imported_data.data(:,1));

figure
histogram(imported_data.data(:,1),'Normalization','cdf')


% also https://www.mathworks.com/matlabcentral/answers/426214-how-to-plot-a-histogram-as-a-curve