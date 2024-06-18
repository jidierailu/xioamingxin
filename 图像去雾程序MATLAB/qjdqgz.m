%求解全局大气光照函数
%A为暗通道
%I1为原彩色图像
%Ac为全局大气光照

function  [Ac]=qjdqgz(A,I1)
I1=im2double(I1);
R1=I1(:,:,1);
G1=I1(:,:,2);
B1=I1(:,:,3);
[a,b]=size(A);
c=ceil(a*b/1000);        %朝正无穷大方向取整
r1=zeros(c,1);
g1=zeros(c,1);
b1=zeros(c,1);
m=0.9;
x=1;
d(1,1)=0;
q(1,1)=0;
while size(d,1)<=c
for i=1:a
for j=1:b
if A(i,j)>m && size(d,1)<=c
d(x,1)=i;
q(x,1)=j;
x=x+1;
end
if size(d,1)>c
     break 
end
end
end
if size(d,1)<=c
m=m-0.1;
end
end
for p=1:c
r1(p,1)=R1(d(p,1),q(p,1));
g1(p,1)=G1(d(p,1),q(p,1));
b1(p,1)=B1(d(p,1),q(p,1));
end
Ar=max(max(r1));
Ag=max(max(g1));
Ab=max(max(b1));
Ac=[Ar,Ag,Ab];
