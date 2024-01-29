function [] = makelist(listname, comment, instsubd, afilter, minsize, maxsize, sizesort)

%% BEGIN LIST CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%listname = "list-201-400-s";
%comment = "All instances sizes 201-400, sorted by size.";

% Select subdirectories from:
% ["QAPLIB", "Palubeckis", "DreTai", "DruganComposite", "StuFer"]
if isempty(instsubd)
    instsubd = ["QAPLIB", "PaluGen", "PaluEuclidGen", "Drezner", "Hypercube","StuFerGen","TaiBGen","TermGen","UniRndGen"];
end

% Filter instance names excluding all numbers
% Uses regex, see https://en.wikipedia.org/wiki/Regular_expression#POSIX_basic_and_extended
% for example:
% "^chr*$|^had$|^tai[be]$|^sko$"
% For all instances:
% "^.*$"
if isempty(afilter)
    afilter = "^.*$";
end

% Minimum and maximum sizes of instances to be put in the list - inclusive
if isempty(minsize)
    minsize=0;
end
if isempty(maxsize)
    maxsize=Inf;
end

% Enable sorting by size.
if isempty(sizesort)
    sizesort=false;
end

%% END LIST CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

instances=[""];
instsizes=[0];

pwdir = pwd;
listdir = [pwd '\Lists\'];
instdir = [pwd '\ProblemData\'];

listfile = strcat(listdir,listname);

for i = 1:numel(instsubd)
    disp(strcat(instdir,instsubd(i)));
    cd(instdir);
    instfiles = dir(instsubd(i));
    for j = 3:numel(instfiles)
        ifID = fopen([instfiles(j).folder '\' instfiles(j).name],'r');
        ss = str2num(fgets(ifID));
        fclose(ifID);
        
        n1 = instfiles(j).name(1:end-4);
        n2 = n1(isstrprop(n1,'alpha'));
        n3 = regexp(n2,afilter);
        
        if (ss >= minsize && ss <= maxsize && strcmp(instfiles(j).name(end-3:end),'.dat') && ~isempty(n3))
            instances(end+1) = strrep(strcat(instsubd(i),'\',instfiles(j).name),'\','/');
            instsizes(end+1) = ss;
        end
    end
    cd(pwdir);
end

instsizes = instsizes(2:end);
instances = instances(2:end);

if sizesort
    [X,I] = sort(instsizes);
    instances = instances(I);
end



ofID = fopen(listfile,'w');
fprintf(ofID,'%d\n',numel(instsizes));
fprintf(ofID,'%s\n',comment);
for i = 1:numel(instances)
    fprintf(ofID,'%s\n',instances(i))
end
fclose(ofID);

end