function [ row ] = classifysample( Pathname,filename,clasifier ,train,ytrain)
I_filepath=strcat(Pathname,filename);
orig=imread(I_filepath);
filename(end-1)='n';
filename(end-2)='p';
I_filepath=strcat(Pathname,filename);
image = imread(I_filepath);
figure,imshow(image);
grayimage = rgb2gray(image);
BW = edge(grayimage,'canny');
BW = imdilate(BW,ones(5,5));
BW = ~BW;
[Labels no_objects] = bwlabel(BW); %Integer labels starting from 0
[h w] = size(image);
smallRatio = h*w*0.0002;
indx=0;
figure,imshow(orig);
for i=1:no_objects
    x = uint8(Labels==i);
    f = sum(sum(x==1));
     if(f < smallRatio) % to neglect small regions
         continue;
     end
     indx=indx+1;
     if(indx==1)
          continue;
     end 
     
     d = zeros(size(image));
    d(:,:,1) = uint8(x).*image(:,:,1);
    d(:,:,2) = uint8(x).*image(:,:,2);
    d(:,:,3) = uint8(x).*image(:,:,3);
    z=im2bw(d);
[s]=bwareafilt(z,1);
st = regionprops(s, 'BoundingBox');
bb=[st.BoundingBox];
ropp = imcrop(orig, bb);
ff=rgb2gray(ropp);
[row] = glcm_data(ff);
res=-1;
if(clasifier==1)
   res= KNN_Sabri( train,row,ytrain,0,.7 );
end
    if(clasifier==2)
   [ res ] = MKnn( train,row,ytrain,7);
end 
   if(clasifier==3)
   [ res ] = svm_class(train,row,ytrain);
   end 
rectangle('Position', bb,'EdgeColor', 'b')
txt='';
if(res==1)
    txt='cat';
elseif(res==2)
    txt='laptop';
  elseif(res==3)
      txt='apple';
    elseif(res==4)
        txt='car';
        elseif(res==5)
            txt='helicopter';
end
text(bb(1),bb(2),txt,'Color','green','FontSize',20) ;
end

end

