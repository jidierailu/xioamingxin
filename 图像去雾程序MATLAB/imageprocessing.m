clc
clear
close all;
%����ԭʼͼƬ����ʾ
figure(1)
subplot(1,2,1)
I1=imread('����1.png');          
imshow(I1)
title('����ͼ��1')
impixelinfo;                         %��ʾ���������Լ�����ֵ

figure(1)   
subplot(1,2,2)
I2=imread('����2.png');          
figure(1)
imshow(I2)
title('����ͼ��2')
impixelinfo;                               %��ʾ���������Լ�����RGBֵ


%��ⰵͨ������ʾ��ͨ��ͼ��
%��ⰵͨ������     A=antongdao(a,m,n);
%aΪ��ɫͼ�����;m,nΪ�˲����ڴ�С,�˲������Լ�����һ����3*3,5*5,9*9,15*15,25*25
%AΪ����İ�ͨ��
A1=antongdao(I1,25,25);
figure(2)
subplot(1,2,1)
imshow(A1)
title('��ͨ��ͼ��1')


A2=antongdao(I2,5,5);
figure(2)
subplot(1,2,2)
imshow(A2)
impixelinfo;                         %��ʾ���������Լ�����ֵ
title('��ͨ��ͼ��2')
 
%���ȫ�ִ������պ���
%AΪ��ͨ��
%I1Ϊԭ��ɫͼ��
%AcΪȫ�ִ�������
[Ac1]=qjdqgz(A1,I1);
[Ac2]=qjdqgz(A2,I2);
%���͸���ʺ�����ȥ���RGBֵ
%I1Ϊԭ��ɫͼ��
%AcΪȫ�ִ�������
%tΪ͸����
%R1,G1,B1Ϊȥ����ֵ
[t1,R1,G1,B1]=tsl(I1,Ac1);
[t2,R2,G2,B2]=tsl(I2,Ac2);
I1=cat(3,R1,G1,B1);
I2=cat(3,R2,G2,B2);
figure(3)
subplot(1,2,1)
% I1=im2uint8(I1);
imshow(I1)
title('ȥ��ͼ��1 ');
impixelinfo;

subplot(1,2,2)
% I2=im2uint8(I2);
imshow(I2)
title('ȥ��ͼ��2 ');
impixelinfo;






