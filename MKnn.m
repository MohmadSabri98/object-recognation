function [ res ] = MKnn( train,predict,yy,k )
[h w]=size(train);
nearst=zeros(h,2);
for i=1:h
    label=yy(i,1);
    distance=round(sqrt(sum((train(i,:)-predict).^2)));
    nearst(i,1)=distance;
    nearst(i,2)=label;
end
wclases=double(zeros(1,5));
out=sortrows(nearst,[1]);
dk=max(nearst(:,1));
d1=min(nearst(:,1));

   for j=1:k
       if(dk~=d1)
    wclases(nearst(j,2))=wclases(nearst(j,2))+((dk-nearst(j,1))/(dk-d1));
       end 
     if(dk==d1)
    wclases(nearst(j,2))=wclases(nearst(j,2))+1;
   end 
   end
   sum1=-1000000;
   
for i=1:5
    if(sum1<wclases(i))
   res=i;     
   sum1=wclases(i);
    end
end
end

