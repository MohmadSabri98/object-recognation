function res = error_rnn( act,labeels )
correct1=0;
[h,w]=size(act);
for i=1:h
    if(act==labeels(i,1))
        correct1=correct1+1;
    end
end
res=1-(correct1/h)
end