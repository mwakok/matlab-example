function checkInstalledDependencies(dependencyFile)
% Checks whether all required MATLAB Addons are installed
%
% Args:
% dependencyFile: filepath of the dependency file created with getDependencies.m
%

arguments
    dependencyFile string = 'MATLAB_ADDONS.txt'
end

% Get required and installed dependencies
addons = matlab.addons.installedAddons;
requiredDeps = readlines(dependencyFile, 'EmptyLineRule','skip');
installedDeps = strrep(addons.Name, ' ', '_');

% Compare dependencies
for i= 1:length(requiredDeps)
    isInstalled = any(contains(installedDeps, requiredDeps(i)));
    if ~isInstalled
        warning('Dependency %s is not installled', requiredDeps(i))
    end
end

end