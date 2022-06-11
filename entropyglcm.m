function result = entropyglcm( glcm )
S = 0.0;
S = double(S);
for i=1:8
    for j=1:8
        if(~glcm(i,j)==0)
        S = S + (log(glcm(i,j))*glcm(i,j));
        end
    end
end
if (S ~= 0)
    result = -1 * S;
end
if (S == 0)
    result = S;
end

end

