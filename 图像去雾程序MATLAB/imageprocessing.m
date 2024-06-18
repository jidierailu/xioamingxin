clc
clear
close all;
%导入原始图片并显示
figure(1)
subplot(1,2,1)
I1=imread('迷雾1.png');          
imshow(I1)
title('有雾图像1')
impixelinfo;                         %显示像素坐标以及像素值

figure(1)   
subplot(1,2,2)
I2=imread('迷雾2.png');          
figure(1)
imshow(I2)
title('有雾图像2')
impixelinfo;                               %显示像素坐标以及像素RGB值


%求解暗通道并显示暗通道图像
%求解暗通道函数     A=antongdao(a,m,n);
%a为彩色图像矩阵;m,n为滤波窗口大小,滤波窗口自己设置一般是3*3,5*5,9*9,15*15,25*25
%A为计算的暗通道
A1=antongdao(I1,25,25);
figure(2)
subplot(1,2,1)
imshow(A1)
title('暗通道图像1')


A2=antongdao(I2,5,5);
figure(2)
subplot(1,2,2)
imshow(A2)
impixelinfo;                         %显示像素坐标以及像素值
title('暗通道图像2')
 
%求解全局大气光照函数
%A为暗通道
%I1为原彩色图像
%Ac为全局大气光照
[Ac1]=qjdqgz(A1,I1);
[Ac2]=qjdqgz(A2,I2);
%求解透射率函数及去雾后RGB值
%I1为原彩色图像
%Ac为全局大气光照
%t为透射率
%R1,G1,B1为去雾后的值
[t1,R1,G1,B1]=tsl(I1,Ac1);
[t2,R2,G2,B2]=tsl(I2,Ac2);
I1=cat(3,R1,G1,B1);
I2=cat(3,R2,G2,B2);
figure(3)
subplot(1,2,1)
% I1=im2uint8(I1);
imshow(I1)
title('去雾图像1 ');
impixelinfo;

subplot(1,2,2)
% I2=im2uint8(I2);
imshow(I2)
title('去雾图像2 ');
impixelinfo;






