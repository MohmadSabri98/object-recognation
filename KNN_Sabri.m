function [predict] = KNN_Sabri( train,predict,yy,ytest,r )
[h w]=size(train);
nearst=zeros(h,2);
for i=1:h
    label=yy(i,1);
    distance=sqrt(sum((train(i,:)-predict).^2));
    nearst(i,1)=distance;
    nearst(i,2)=label;
end
out=sortrows(nearst,[1]);
A=[];
bool=0;
for i=1:h
    if(r>=out(i,1))
 if(bool==0)
     A=[out(i,2)];
 end
 if(bool==1)
     A=[A;out(i,2)];
 end
 bool=1;
    end
end

[M,F] = mode(A(:));
predict=M;
end

