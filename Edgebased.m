function [test,data1,label] = Edgebased(Pathname,filename)
I_filepath=strcat(Pathname,filename);
orig=imread(I_filepath);
test=[];
data1=[];
label=[];
bool=0;
if(  strcmp(filename,'T1 - Cat Laptop .jpg')==1)
    filename='T1 - Cat Laptop .png';
    test=[0 0 1 0 2 0 0 0];
elseif(strcmp(filename,'T2 - Cat Laptop.jpg')==1)
    filename='T2 - Cat Laptop.png';
    test=[0 1 0 2 ];
elseif(strcmp(filename,'T3 - Laptop.jpg')==1)
    filename='T3 - Laptop.png';
    test=[2 0 0 0];
elseif(strcmp(filename,'T4 - Cat Car.jpg')==1)
    filename='T4 - Cat Car.png';
    test=[0 4 0 1];
    elseif(strcmp(filename,'T5 - Apple Laptop.jpg')==1)
    filename='T5 - Apple Laptop.png';
    test=[0 3 2]; 
    elseif(strcmp(filename,'T6 - Helicopter.jpg')==1)
    filename='T6 - Helicopter.png';
    test=[0 0 5 0];
    elseif(strcmp(filename,'T7 - Apple Cat Helicopter.jpg')==1)
    filename='T7 - Apple Cat Helicopter.png';
    test=[0 5 1 3];
    elseif(strcmp(filename,'T8 - Car Laptop.jpg')==1)
    filename='T8 - Car Laptop.png';
    test=[0 4];
    elseif(strcmp(filename,'T9 - Apple.jpg')==1)
    filename='T9 - Apple.png';
    test=[0 3 0];
    elseif(strcmp(filename,'T10 - Cat Car.jpg')==1)
    filename='T10 - Cat Car.png';
    test=[0 1 4]; 
    elseif(strcmp(filename,'T11 - Cat.jpg')==1)
    filename='T11 - Cat.png';
    test=[0 1];
    elseif(strcmp(filename,'T12 - Cat Laptop.jpg')==1)
    filename='T12 - Cat Laptop.png';
    test=[0 2 1];
    elseif(strcmp(filename,'T13 - Car Helicopter.jpg')==1)
    filename='T13 - Car Helicopter.png';
    test=[0 4 0 5];
    elseif(strcmp(filename,'T14 - Car.jpg')==1)
    filename='T14 - Car.png';
    test=[0 4 0];
end
I_filepath=strcat(Pathname,filename);
image = imread(I_filepath);
grayimage = rgb2gray(image);
BW = edge(grayimage,'canny');
BW = imdilate(BW,ones(5,5));
BW = ~BW;
[Labels no_objects] = bwlabel(BW); %Integer labels starting from 0
[h w] = size(image);
smallRatio = h*w*0.0002;
indx=0;
for i=1:no_objects
    x = uint8(Labels==i);
    f = sum(sum(x==1));
     if(f < smallRatio) % to neglect small regions
         continue;
     end
     indx=indx+1;
     if(test(indx)~=0)
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
if(bool==0)
    data1=row;
    label=[test(indx)];
end
if(bool==1)
    cv=row;
    data1=[data1;cv];
    label=[label;test(indx)];
end

     end
     bool=1;
end


end

