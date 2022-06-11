function [features,ylabel] = Get_train_features( path)
files = dir(path);
directoryNames = {files([files.isdir]).name};
directoryNames = directoryNames(~ismember(directoryNames,{'.','..'}));
A=zeros(1,12);
xs=0;
bool=0;
for i=1:length(directoryNames)
  folder=directoryNames{i};
   imdirpath = fullfile(path, folder);
   filenames = dir(fullfile(imdirpath , '*.jpg'));
   num_images = length(filenames); 
   label=str2num(folder);
   for j = 1:num_images
      filename1 = fullfile(imdirpath, filenames(j).name);
      image = imread(filename1); 
      
       B=rgb2gray(image);
      glcm1 = Glm( B,[1 1]);
      glcm2 = Glm( B,[1 0]);
      glcm3 = Glm( B,[0 1]);
       r1 = contranst( glcm1 );
       r2 = energy( glcm1 );
      r3 = homogenity( glcm1 );
      r4 = entropy( glcm1 );
      r11 = contranst( glcm2 );
       r21 = energy( glcm2 );
      r31 = homogenity( glcm2 );
      r41 = entropy( glcm2 );
      r12 = contranst( glcm3 );
       r22 = energy( glcm3 );
      r32 = homogenity( glcm3 );
      r42 = entropy( glcm3 );
      meannn=[r1 r2 r3 r4;r11 r21 r31 r41;r12 r22 r32 r42];
      meannn=mean(meannn);
        if(bool==0)
        A=meannn;
        xs=[label];
        double(A);
        end
    
   if(bool==1)
    
       b=meannn;
       double(b);
       fg=[label];
       xs=[xs;fg];
       A = [A; b];
   end        
   bool=1;
   end
   
end
features=A;
ylabel=xs;
end

