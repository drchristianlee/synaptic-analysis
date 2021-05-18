% This script can be used to plot histograms of distance data. 

[file_nm, path] = uigetfile;
cd(path);
load(file_nm);

plot_select = str2num(cell2mat(inputdlg('Would you like to plot a cdf histogram ? Press 1 for yes')));

figure(1)
figure(2)
figure(3)

if plot_select == 1;
    for stepper = 1:size(imported_data.data, 2);
    [values, edges] = histcounts(imported_data.data(:, stepper), 'Normalization', 'cdf');
    centers = (edges(1:end-1)+edges(2:end))/2;
    figure(1)
    plot(centers, values, 'k-')
    hold on
    % Plot both, line superimposed on the histogram
    figure(2)
    h = histogram(imported_data.data(:, stepper), 'Normalization', 'cdf');
    hold on
    plot(centers, values, 'k-')
    hold on
    %now plot all on a single histogram
    figure(3)
    h = histogram(imported_data.data, 'Normalization', 'cdf');
    end
else
    for stepper = 1:size(imported_data.data, 2);
    %[values, edges] = histcounts(imported_data.data(:, stepper), 'Normalization', 'probability');
    [values, edges] = histcounts(imported_data.data(:, stepper));
    centers = (edges(1:end-1)+edges(2:end))/2;
    figure(1)
    plot(centers, values, 'k-')
    hold on
    % Plot both, line superimposed on the histogram
    figure(2)
    %h = histogram(imported_data.data(:, stepper), 'Normalization', 'probability');
    histogram(imported_data.data(:, stepper))
    hold on
    plot(centers, values, 'k-')
    hold on
    %now plot all on a single histogram
    figure(3)
    %histogram(imported_data.data, 'Normalization', 'probability');
    histogram(imported_data.data);
    end
end
% https://www.mathworks.com/matlabcentral/answers/426214-how-to-plot-a-histogram-as-a-curve
