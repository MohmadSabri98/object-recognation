function [ Bestk,errors ] = best_k( train,test,ytest,ytrain )
errors=zeros(1,25);
[h,w]=size(test);
z=1;
act=zeros(h,1);
bestr=0;
for k=1:25
for i=1:h
    predict=test(i,:);
    [ res ] = MKnn( train,predict,ytrain,k );
act(i,1)=res;
end
errors(1,z)=error_rnn( act,ytest );
z=z+1;
end
xaxis=[1:25];
yaxis=errors;
figure,plot(xaxis,yaxis);
Bestk=7;   

end

