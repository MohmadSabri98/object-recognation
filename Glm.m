function glcm = Glm( image,rel)
%image=rgb2gray(image);
%image A = [0 0 0 1 2; 1 1 0 1 1;2 2 1 0 0; 1 1 0 2 0;0 0 1 0 1]; rel=[1 1];
[ ss ] = normalize( image,0,5);
image=round(ss);
noinle1 = unique(image);
[sz,s]=size(noinle1);
slm=zeros(sz,sz);

[H W l] = size(image) ;
for	i=1:sz
    for	j=1:sz
        sum2=0;
        for	y=1:H
	        for x=1:W
                if(y+rel(2)<=H&&y+rel(2)>=1&&x+rel(1)<=W&&x+rel(1)>=1)
                      if(image(y,x)==noinle1(i))
                         if(image(y+rel(2),x+rel(1))==noinle1(j))
                              sum2=sum2+1;
                         end
                      end
                end         
            end
         end
    slm(i,j)=sum2;
    
    end
     
end
slm=slm+slm.';
  sfd=sum(sum(slm));

glcm=slm/sfd;

end

