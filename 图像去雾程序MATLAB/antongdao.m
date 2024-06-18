%计算暗通道函数
%c为彩色图像矩阵;m,n为滤波窗口大小
%A为计算的暗通道

function  A=antongdao(c,m,n)
c=im2double(c);
[a,b,~]=size(c);
R1=c(:,:,1);
G1=c(:,:,2);
B1=c(:,:,3);
A=zeros(a,b);
d=A;
for i=1:a
for j=1:b
d(i,j)=min(R1(i,j),G1(i,j));
A(i,j)=min(d(i,j),B1(i,j));
end
end
A=ordfilt2(A,1,ones(m,n));                     %最小值滤波

