clear all
A = imread('images/rose.jpg');

row = size(A)(1);
col = size(A)(2);

B = zeros(row,col);
B = uint8(B);

threshold = 190;

for i=2:row-2
  for j=2:col-2
    p1 = uint16((A(i-1,j-1,1)+A(i-1,j-1,2)+A(i-1,j-1,3))/3);
    p2 = uint16((A(i,j-1,1)+A(i,j-1,2)+A(i,j-1,3))/3);
    p3 = uint16((A(i+1,j-1,1)+A(i+1,j-1,2)+A(i+1,j-1,3))/3);
    p4 = uint16((A(i-1,j,1)+A(i-1,j,2)+A(i-1,j,3))/3);
    p5 = uint16((A(i,j,1)+A(i,j,2)+A(i,j,3))/3);
    p6 = uint16((A(i+1,j,1)+A(i+1,j,2)+A(i+1,j,3))/3);
    p7 = uint16((A(i-1,j+1,1)+A(i-1,j+1,2)+A(i-1,j+1,3))/3);
    p8 = uint16((A(i,j+1,1)+A(i,j+1,2)+A(i,j+1,3))/3);
    p9 = uint16((A(i+1,j+1,1)+A(i+1,j+1,2)+A(i+1,j+1,3))/3);
    
    Gx = uint16(abs(-p1+p3-p4+p6-p7+p9));
    Gy = uint16(abs(p1+p2+p3-p7-p8-p9));

    prewitt = uint16(sqrt(Gx**2+Gy**2));
    
    if prewitt > 255
      prewitt = 255;
    end
    if prewitt < threshold
      prewitt = 0;
    end
    
    B(i,j) = prewitt;
  endfor
endfor

imshow(B);