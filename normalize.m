function [ myImgNorm  ] = normalize( myImg,newMin,newMax )

myImgNorm = (myImg - min(myImg(:)))*(newMax - newMin)/(max(myImg(:)) - min(myImg(:))) + newMin;

end

