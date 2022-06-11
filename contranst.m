function result = contranst( glcm )
sum=0;
[H W ] = size(glcm) ;
for x=1:W
for	y=1:H
	sum=sum+((x-y)^2*glcm(y,x));
    end
end
result =sum;

end

