function result = homogenity( glcm )
sum=0;
[H W ] = size(glcm) ;
for x=1:W
for	y=1:H
	sum=sum+(glcm(y,x)/(1+abs(x-y)));
    end
end
result =sum;

end

