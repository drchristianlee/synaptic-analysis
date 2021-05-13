[file_nm, path] = uigetfile;
cd(path);
load(file_nm);

plot_select = str2num(cell2mat(inputdlg('Would you like to plot a cdf histogram ? Press 1 for yes')));

figure
histogram(imported_data.data(:,1));

figure
histogram(imported_data.data(:,1), 'Normalization', 'probability')

figure
histogram(imported_data.data(:,1),'Normalization','cdf')

if plot_select == 1;
    
[values, edges] = histcounts(imported_data.data(:,1), 'Normalization', 'cdf');
centers = (edges(1:end-1)+edges(2:end))/2;
figure
plot(centers, values, 'k-')
% Plot both, line superimposed on the histogram
figure
h = histogram(imported_data.data(:,1), 'Normalization', 'cdf');
hold on
plot(centers, values, 'k-')

else
    
[values, edges] = histcounts(imported_data.data(:,1), 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
figure
plot(centers, values, 'k-')
% Plot both, line superimposed on the histogram
figure
h = histogram(imported_data.data(:,1), 'Normalization', 'probability');
hold on
plot(centers, values, 'k-')

end
% https://www.mathworks.com/matlabcentral/answers/426214-how-to-plot-a-histogram-as-a-curve
