function holdercells = load_mat_files
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
folder = uigetdir(matlabroot , 'Choose folder to analyze');
cd(folder);
filePattern = fullfile(folder, '*.mat');
matfiles = dir(filePattern);
count = length(matfiles);
keepercol = 1;
for f = 1:count;
    B = matfiles(f, 1).name;
    currkeeper = load(B);
    name = char(fieldnames(currkeeper));
    holdercells(1, f) = {currkeeper.(name)};
end

end

