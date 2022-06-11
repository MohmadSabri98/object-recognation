function [ row ] = glcm_data( image )
[ myImgNorm  ] = normalize( image,0,5 )
glcm1 = Glm( image,[1 1]);
      glcm2 = Glm( image,[1 0]);
      glcm3 = Glm( image,[0 1]);
      r1 = contranst( glcm1 );
       r2 = energy( glcm1 );
      r3 = homogenity( glcm1 );
      r4 = entropy( glcm1 );
      r11 = contranst( glcm2 );
       r21 = energy( glcm2 );
      r31 = homogenity( glcm2 );
      r41 = entropy( glcm2 );
      r12 = contranst( glcm3 );
       r22 = energy( glcm3 );
      r32 = homogenity( glcm3 );
      r42 = entropy( glcm3 );
      meannn=[r1 r2 r3 r4;r11 r21 r31 r41;r12 r22 r32 r42];
      row=mean(meannn);
      
end

