%求解透射率函数及去雾后RGB值
%I1为原彩色图像
%Ac为全局大气光照
%t为透射率
%R1,G1,B1为去雾后的值
function  [t,R1,G1,B1]=tsl(I1,Ac)
[a,b,~]=size(I1);
I1=im2double(I1);
R1=I1(:,:,1);
G1=I1(:,:,2);
B1=I1(:,:,3);
t=zeros(a,b);
d=t;
for i=1:a
     for j=1:b
   d(i,j)=min(R1(i,j)/Ac(1,1),G1(i,j)/Ac(1,2));
   t(i,j)=1-0.95*min(d(i,j),B1(i,j)/Ac(1,3));
     end
end
t=imguidedfilter(t);                      %导向滤波

for i=1:a
     for j=1:b
            R1(i,j)=(R1(i,j)-Ac(1,1))./(max(t(i,j),0.1))+Ac(1,1);
            G1(i,j)=(G1(i,j)-Ac(1,2))./(max(t(i,j),0.1))+Ac(1,2);
            B1(i,j)=(B1(i,j)-Ac(1,3))./(max(t(i,j),0.1))+Ac(1,3);
            
     end
end