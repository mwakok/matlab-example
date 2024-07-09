function deps = getDependencies(fileList, printFile)
% Returns the MATLAB products necessary to execute the indicated files, and
% optionally prints them to file
%   An arbitrary number of input files can be provided in the form of
%   individual names or regular expressions. The latter make it possible to
%   analyze the dependencies of multiple file and/or file types, in different
%   folders and subfolders, at the same time.
%
%   The list of dependencies is returned as a workspace variable and is
%   optinally printed in the indicated text file, together with the MATLAB
%   version used to run the current function.

% Inputs:
%   fileList: string array of file names or regular expressions
%   printFile: string with the rel. path of the file to print the dependencies, default is "MATLAB_ADDONS.txt
%
% Outputs:
%   deps: string array of MATLAB products necessary to execute the input files
%
% Examples:
%   deps = check_dependencies("myFile.m")
%   deps = check_dependencies("myFol\*.m")
%   deps = check_dependencies("myFol\*.m", "dependencies.txt")
%   deps = check_dependencies(["myFol\*.m";"myFol\**\*.mlx"], "dependencies.txt",)

arguments
    fileList (:,1) string = 'src/**/*.m'  % array of strings, gets transformed to column
    printFile string = 'MATLAB_ADDONS.txt'   % rel.path of print file, optional
end

%% Initialize dependencies cell array
numFiles = numel(fileList);
depsCell = cell(1, numFiles);

%% Find toolbox dependencies
for i = 1:numFiles
    files = {dir(fileList(i)).name}; % Get list of files in directory
    [~, toolboxList] = matlab.codetools.requiredFilesAndProducts(files);
    depsCell{i} = {toolboxList(:).Name};
end

%% Flatten and process dependencies
depsFlat = horzcat(depsCell{:});
depsFlat = unique(depsFlat); % Remove duplicates
depsFlat = cellfun(@(x) strrep(x,' ','_'), depsFlat, 'UniformOutput', false); % Replace spaces with '_'

%% Remove 'MATLAB' from the dependencies
depsFlat(strcmpi(depsFlat, 'MATLAB')) = [];

%% Convert to string array
deps = string(depsFlat)';

%% Print to file
if ~isempty(printFile)
    fid = fopen(printFile, "w");
    if fid == -1
        error('Error opening file: %s', printFile);
    end
    fprintf(fid, "%s\n", deps);    
    fclose(fid);
end
end