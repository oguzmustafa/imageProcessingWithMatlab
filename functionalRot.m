clear all
A = imread('images/Safari.jpg');
row=size(A)(1)
col=size(A)(2)
shfact=100;
orj=A;

for i=1:row
for j=1:col
k=floor( i + shfact*j/col);
l=floor( j + shfact*sin(pi*i/row));
%  if l<=col
  B(k,l,:)=orj(i,j,:);
%  end
end
end
imshow(B);
