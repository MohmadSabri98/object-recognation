function result = energy( glcm )
sum=0;
[H W ] = size(glcm) ;
for x=1:W
for	y=1:H
	sum=sum+(glcm(y,x)^2);
    end
end
result =sum;

end

