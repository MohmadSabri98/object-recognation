function [ bestr,errors ] = best_r( train,test,ytest,ytrain )
errors=zeros(1,10);
[h,w]=size(test);
z=1;
act=zeros(h,1);
bestr=0;
for r=.1:.1:1
for i=1:h
    predict=test(i,:);
[ypredicted] = KNN_Sabri( train,predict,ytrain,ytest(i,1),r );
act(i,1)=ypredicted;
end
errors(1,z)=error_rnn( act,ytest );
z=z+1;
end
xaxis=[.1:.1:1];
yaxis=errors;
figure,plot(xaxis,yaxis);
bestr=.7;   
end

