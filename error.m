function res = error( act,labeels,k )
correct1=0;
for i=1:k
    if(act==labeels(i,1))
        correct1=correct1+1;
    end
end
res=1-(correct1/k)
end

