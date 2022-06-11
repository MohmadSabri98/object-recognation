function  ent  = Entropy ( image )
[h, w] = size(image);
img = unique(image);
cnt = [img,histc(image(:),img)];
cnt = double(cnt);
n = size(cnt);
S = 0.0;
S = double(S);
for i=1:n
    S = S + ((cnt(i,2)/(h*w))*(log2(cnt(i,2)/(h*w))));
end
ent = -1 * S;
end

