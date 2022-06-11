function [features,labels] = Get_Test_features( path)
% files = dir(path);
% directoryNames = {files([files.isdir]).name};
% directoryNames = directoryNames(~ismember(directoryNames,{'.','..'}));
A=[];
labels=[];
bool=0;
% for i=1:length(directoryNames)
%   folder=directoryNames{i};
%    imdirpath = fullfile(path, folder);
   filenames = dir(fullfile(path , '*.jpg'));
   num_images = length(filenames); 
   for j = 1:num_images
      filename1 = fullfile(path, filenames(j).name);
      zxp=strcat(path,'\');
      
      [test1,data1,label1] = Edgebased(zxp,filenames(j).name);
      if(bool==0)
       b=data1;
       A = b;
       labels=label1;
   end    
   if(bool==1)
       b=data1;
       A = [A; b];
       labels=[labels;label1];
   end        
   bool=1;
   end
   

features=A;
end

