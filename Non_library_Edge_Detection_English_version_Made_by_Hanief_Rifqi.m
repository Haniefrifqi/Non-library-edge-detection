%
%%original made by: Hanief Rifqi Murdaka
%%
close all;
clear;
clc;
%load image
gambar=imread('D:\Proyek\6. Lain-lain\Github\1. Edge Detection with Matlab\Helikopter.jpeg');
%Convert image from RGB channel to grayscale channel
grey= (0.2989 * double(gambar(:,:,1)) + 0.5870 * double(gambar(:,:,2)) + 0.1140 * double(gambar(:,:,3)))/255;
%Find matrix size from greyscale image
[m,n]=size(grey);
%%
%%Find edge detection with robert method
%Declaration of new matrix for saving the result of convolution grayscale image's matrix with robert method
hasilr1=zeros(m,n);
hasilr2=zeros(m,n);
%Declaration of new matrix for saving the result of total gradient calculation
hasilr=zeros(m,n);
%r1 = robert kernel on X axis; r2= robert kernel on Y axis
r1=([-1 0;0 1])./2;
r2=([0 -1;1 0])./2;
%Convolution code of greyscale image's matrix with robert kernel's matrix (r1)
for i=1:m
    for j=1:n
        if j~=n&&i~=m
            hasilr1(i,j)=(grey(i,j)*r1(1,1))+(grey(i,j+1)*r1(1,2))+(grey(i+1,j)*r1(2,1))+(grey(i+1,j+1)*r1(2,2));
        elseif j==n&&i~=m
            hasilr1(i,j)=(grey(i,j)*r1(1,1))+(grey(i+1,j)*r1(2,1));
        elseif j~=n&&i==m
            hasilr1(i,j)=(grey(i,j)*r1(1,1))+(grey(i,j+1)*r1(1,2));
        elseif j==n&&i==m
            hasilr1(i,j)=(grey(i,j)*r1(1,1));
        end
    end
end
%Convolution code of greyscale image's matrix with robert kernel's matrix (r2)
for i=1:m
    for j=1:n
        if j~=n&&i~=m
            hasilr2(i,j)=(grey(i,j)*r2(1,1))+(grey(i,j+1)*r2(1,2))+(grey(i+1,j)*r2(2,1))+(grey(i+1,j+1)*r2(2,2));
        elseif j==n&&i~=m
            hasilr2(i,j)=(grey(i,j)*r2(1,1))+(grey(i+1,j)*r2(2,1));
        elseif j~=n&&i==m
            hasilr2(i,j)=(grey(i,j)*r2(1,1))+(grey(i,j+1)*r2(1,2));
        elseif j==n&&i==m
            hasilr2(i,j)=(grey(i,j)*r2(1,1));
        end
    end
end
%The code for calculating total gradient from Robert r1 and robert r2
for i=1:m
    for j=1:n
        hasilr(i,j)=abs(hasilr1(i,j))+abs(hasilr2(i,j));
    end
end

%%
%%Edge Detection with Sobel method
%Declaration of new matrix for saving the result of convolution grayscale image's matrix with sobel method
hasils1=zeros(m,n);
hasils2=zeros(m,n);
%Declaration of new matrix for saving the result of total gradient calculation
hasils=zeros(m,n);
%s1=Sobel kernel on X axis; s2= Sobel kernel on Y axis
s1=([-1 -2 -1;0 0 0;1 2 1])./8;
s2=([-1 0 1; -2 0 2; -1 0 1])./8;
%Convolution code of greyscale image's matrix with sobel kernel's matrix (s1)
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i,j+1)*s1(2,3))+(grey(i+1,j)*s1(3,2))+(grey(i+1,j+1)*s1(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i,j+1)*s1(2,3))+(grey(i+1,j+1)*s1(3,3))+(grey(i+1,j)*s1(3,2))+(grey(i+1,j-1)*s1(3,1))+(grey(i,j-1)*s1(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i,j-1)*s1(2,1))+(grey(i+1,j)*s1(3,2))+(grey(i+1,j-1)*s1(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i-1,j)*s1(1,2))+(grey(i-1,j+1)*s1(1,3))+(grey(i,j+1)*s1(2,3))+(grey(i+1,j+1)*s1(3,3))+(grey(i+1,j)*s1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i-1,j)*s1(1,2))+(grey(i-1,j-1)*s1(1,1))+(grey(i,j-1)*s1(2,1))+(grey(i+1,j-1)*s1(3,1))+(grey(i+1,j)*s1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i-1,j)*s1(1,2))+(grey(i-1,j+1)*s1(1,3))+(grey(i,j+1)*s1(2,3))+(grey(i+1,j+1)*s1(3,3))+(grey(i+1,j)*s1(3,2))+(grey(i+1,j-1)*s1(3,1))+(grey(i,j-1)*s1(2,1))+(grey(i-1,j-1)*s1(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i-1,j)*s1(1,2))+(grey(i-1,j+1)*s1(1,3))+(grey(i,j+1)*s1(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i,j-1)*s1(2,1))+(grey(i-1,j-1)*s1(1,1))+(grey(i-1,j)*s1(1,2))+(grey(i-1,j+1)*s1(1,3))+(grey(i,j+1)*s1(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            hasils1(i,j)=(grey(i,j)*s1(2,2))+(grey(i,j-1)*s1(2,1))+(grey(i-1,j-1)*s1(1,1))+(grey(i-1,j)*s1(1,2));
        end
    end
end
%Convolution code of greyscale image's matrix with sobel kernel's matrix (s2)
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i,j+1)*s2(2,3))+(grey(i+1,j)*s2(3,2))+(grey(i+1,j+1)*s2(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i,j+1)*s2(2,3))+(grey(i+1,j+1)*s2(3,3))+(grey(i+1,j)*s2(3,2))+(grey(i+1,j-1)*s2(3,1))+(grey(i,j-1)*s2(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i,j-1)*s2(2,1))+(grey(i+1,j)*s2(3,2))+(grey(i+1,j-1)*s2(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i-1,j)*s2(1,2))+(grey(i-1,j+1)*s2(1,3))+(grey(i,j+1)*s2(2,3))+(grey(i+1,j+1)*s2(3,3))+(grey(i+1,j)*s2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i-1,j)*s2(1,2))+(grey(i-1,j-1)*s2(1,1))+(grey(i,j-1)*s2(2,1))+(grey(i+1,j-1)*s2(3,1))+(grey(i+1,j)*s2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i-1,j)*s2(1,2))+(grey(i-1,j+1)*s2(1,3))+(grey(i,j+1)*s2(2,3))+(grey(i+1,j+1)*s2(3,3))+(grey(i+1,j)*s2(3,2))+(grey(i+1,j-1)*s2(3,1))+(grey(i,j-1)*s2(2,1))+(grey(i-1,j-1)*s2(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i-1,j)*s2(1,2))+(grey(i-1,j+1)*s2(1,3))+(grey(i,j+1)*s2(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i,j-1)*s2(2,1))+(grey(i-1,j-1)*s2(1,1))+(grey(i-1,j)*s2(1,2))+(grey(i-1,j+1)*s2(1,3))+(grey(i,j+1)*s2(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            hasils2(i,j)=(grey(i,j)*s2(2,2))+(grey(i,j-1)*s2(2,1))+(grey(i-1,j-1)*s2(1,1))+(grey(i-1,j)*s2(1,2));
        end
    end
end
%The code for calculating total gradient from Sobel s1 and Sobel s2
for i=1:m
    for j=1:n
        hasils(i,j)=abs(hasils1(i,j))+abs(hasils2(i,j));
    end
end

%%
%%Edge Detection with Prewitt method
%Declaration of new matrix for saving the result of convolution grayscale image's matrix with prewitt method 
hasilp1=zeros(m,n); 
hasilp2=zeros(m,n);
%Declaration of new matrix for saving the result of total gradient calculation
hasilp=zeros(m,n);
%p1=prewitt kernel on X axis; p2=prewitt kernel on Y axis
p1=([1 0 -1;1 0 -1;1 0 -1])./6;
p2=([1 1 1;0 0 0;-1 -1 -1])./6;
%Convolution code of greyscale image's matrix with prewitt kernel's matrix (p1)
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i,j+1)*p1(2,3))+(grey(i+1,j)*p1(3,2))+(grey(i+1,j+1)*p1(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i,j+1)*p1(2,3))+(grey(i+1,j+1)*p1(3,3))+(grey(i+1,j)*p1(3,2))+(grey(i+1,j-1)*p1(3,1))+(grey(i,j-1)*p1(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i,j-1)*p1(2,1))+(grey(i+1,j)*p1(3,2))+(grey(i+1,j-1)*p1(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i-1,j)*p1(1,2))+(grey(i-1,j+1)*p1(1,3))+(grey(i,j+1)*p1(2,3))+(grey(i+1,j+1)*p1(3,3))+(grey(i+1,j)*p1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i-1,j)*p1(1,2))+(grey(i-1,j-1)*p1(1,1))+(grey(i,j-1)*p1(2,1))+(grey(i+1,j-1)*p1(3,1))+(grey(i+1,j)*p1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i-1,j)*p1(1,2))+(grey(i-1,j+1)*p1(1,3))+(grey(i,j+1)*p1(2,3))+(grey(i+1,j+1)*p1(3,3))+(grey(i+1,j)*p1(3,2))+(grey(i+1,j-1)*p1(3,1))+(grey(i,j-1)*p1(2,1))+(grey(i-1,j-1)*p1(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i-1,j)*p1(1,2))+(grey(i-1,j+1)*p1(1,3))+(grey(i,j+1)*p1(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i,j-1)*p1(2,1))+(grey(i-1,j-1)*p1(1,1))+(grey(i-1,j)*p1(1,2))+(grey(i-1,j+1)*p1(1,3))+(grey(i,j+1)*p1(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            hasilp1(i,j)=(grey(i,j)*p1(2,2))+(grey(i,j-1)*p1(2,1))+(grey(i-1,j-1)*p1(1,1))+(grey(i-1,j)*p1(1,2));
        end
    end
end
%Convolution code of greyscale image's matrix with prewitt kernel's matrix (p2)
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i,j+1)*p2(2,3))+(grey(i+1,j)*p2(3,2))+(grey(i+1,j+1)*p2(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i,j+1)*p2(2,3))+(grey(i+1,j+1)*p2(3,3))+(grey(i+1,j)*p2(3,2))+(grey(i+1,j-1)*p2(3,1))+(grey(i,j-1)*p2(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i,j-1)*p2(2,1))+(grey(i+1,j)*p2(3,2))+(grey(i+1,j-1)*p2(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i-1,j)*p2(1,2))+(grey(i-1,j+1)*p2(1,3))+(grey(i,j+1)*p2(2,3))+(grey(i+1,j+1)*p2(3,3))+(grey(i+1,j)*p2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i-1,j)*p2(1,2))+(grey(i-1,j-1)*p2(1,1))+(grey(i,j-1)*p2(2,1))+(grey(i+1,j-1)*p2(3,1))+(grey(i+1,j)*p2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i-1,j)*p2(1,2))+(grey(i-1,j+1)*p2(1,3))+(grey(i,j+1)*p2(2,3))+(grey(i+1,j+1)*p2(3,3))+(grey(i+1,j)*p2(3,2))+(grey(i+1,j-1)*p2(3,1))+(grey(i,j-1)*p2(2,1))+(grey(i-1,j-1)*p2(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i-1,j)*p2(1,2))+(grey(i-1,j+1)*p2(1,3))+(grey(i,j+1)*p2(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i,j-1)*p2(2,1))+(grey(i-1,j-1)*p2(1,1))+(grey(i-1,j)*p2(1,2))+(grey(i-1,j+1)*p2(1,3))+(grey(i,j+1)*p2(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            hasilp2(i,j)=(grey(i,j)*p2(2,2))+(grey(i,j-1)*p2(2,1))+(grey(i-1,j-1)*p2(1,1))+(grey(i-1,j)*p2(1,2));
        end
    end
end
%The code for calculating total gradient from prewitt p1 and prewitt p2
for i=1:m
    for j=1:n
        hasilp(i,j)=abs(hasilp1(i,j))+abs(hasilp2(i,j));
    end
end

%%
%%Edge Detection with Canny method
%Declaration of new matrix for saving the result of convolution grayscale image's matrix with gaussian filter's matrix
hasilfiltergauss=zeros(m,n);
%Declaration of new matrix for saving the result of convolution filtered image(with gaussian filter)'s matrix with sobel method
gausssobel1=zeros(m,n);
gausssobel2=zeros(m,n);
%Declaration of new matrix for saving the result of total gradient calculation
gausssobel=zeros(m,n);
%Find the direction value from X-axis and Y-axis gradient
direction=zeros(m,n);
%Declaration of gaussian filter kernel
gauss=[1 2 1;2 4 2;1 2 1];
%Convolution code of greyscale image's matrix with gaussian filter's matrix
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i,j+1)*gauss(2,3))+(grey(i+1,j)*gauss(3,2))+(grey(i+1,j+1)*gauss(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i,j+1)*gauss(2,3))+(grey(i+1,j+1)*gauss(3,3))+(grey(i+1,j)*gauss(3,2))+(grey(i+1,j-1)*gauss(3,1))+(grey(i,j-1)*gauss(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i,j-1)*gauss(2,1))+(grey(i+1,j)*gauss(3,2))+(grey(i+1,j-1)*gauss(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i-1,j)*gauss(1,2))+(grey(i-1,j+1)*gauss(1,3))+(grey(i,j+1)*gauss(2,3))+(grey(i+1,j+1)*gauss(3,3))+(grey(i+1,j)*gauss(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i-1,j)*gauss(1,2))+(grey(i-1,j-1)*gauss(1,1))+(grey(i,j-1)*gauss(2,1))+(grey(i+1,j-1)*gauss(3,1))+(grey(i+1,j)*gauss(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i-1,j)*gauss(1,2))+(grey(i-1,j+1)*gauss(1,3))+(grey(i,j+1)*gauss(2,3))+(grey(i+1,j+1)*gauss(3,3))+(grey(i+1,j)*gauss(3,2))+(grey(i+1,j-1)*gauss(3,1))+(grey(i,j-1)*gauss(2,1))+(grey(i-1,j-1)*gauss(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i-1,j)*gauss(1,2))+(grey(i-1,j+1)*gauss(1,3))+(grey(i,j+1)*gauss(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i,j-1)*gauss(2,1))+(grey(i-1,j-1)*gauss(1,1))+(grey(i-1,j)*gauss(1,2))+(grey(i-1,j+1)*gauss(1,3))+(grey(i,j+1)*gauss(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            hasilfiltergauss(i,j)=(grey(i,j)*gauss(2,2))+(grey(i,j-1)*gauss(2,1))+(grey(i-1,j-1)*gauss(1,1))+(grey(i-1,j)*gauss(1,2));
        end
    end
end
%Convolution code of filtered image(by gaussian filter)'s matrix with Sobel kernel matrix (s1 and s2)
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i,j+1)*s1(2,3))+(hasilfiltergauss(i+1,j)*s1(3,2))+(hasilfiltergauss(i+1,j+1)*s1(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i,j+1)*s1(2,3))+(hasilfiltergauss(i+1,j+1)*s1(3,3))+(hasilfiltergauss(i+1,j)*s1(3,2))+(hasilfiltergauss(i+1,j-1)*s1(3,1))+(hasilfiltergauss(i,j-1)*s1(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i,j-1)*s1(2,1))+(hasilfiltergauss(i+1,j)*s1(3,2))+(hasilfiltergauss(i+1,j-1)*s1(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i-1,j)*s1(1,2))+(hasilfiltergauss(i-1,j+1)*s1(1,3))+(hasilfiltergauss(i,j+1)*s1(2,3))+(hasilfiltergauss(i+1,j+1)*s1(3,3))+(hasilfiltergauss(i+1,j)*s1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i-1,j)*s1(1,2))+(hasilfiltergauss(i-1,j-1)*s1(1,1))+(hasilfiltergauss(i,j-1)*s1(2,1))+(hasilfiltergauss(i+1,j-1)*s1(3,1))+(hasilfiltergauss(i+1,j)*s1(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i-1,j)*s1(1,2))+(hasilfiltergauss(i-1,j+1)*s1(1,3))+(hasilfiltergauss(i,j+1)*s1(2,3))+(hasilfiltergauss(i+1,j+1)*s1(3,3))+(hasilfiltergauss(i+1,j)*s1(3,2))+(hasilfiltergauss(i+1,j-1)*s1(3,1))+(hasilfiltergauss(i,j-1)*s1(2,1))+(hasilfiltergauss(i-1,j-1)*s1(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i-1,j)*s1(1,2))+(hasilfiltergauss(i-1,j+1)*s1(1,3))+(hasilfiltergauss(i,j+1)*s1(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i,j-1)*s1(2,1))+(hasilfiltergauss(i-1,j-1)*s1(1,1))+(hasilfiltergauss(i-1,j)*s1(1,2))+(hasilfiltergauss(i-1,j+1)*s1(1,3))+(hasilfiltergauss(i,j+1)*s1(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            gausssobel1(i,j)=(hasilfiltergauss(i,j)*s1(2,2))+(hasilfiltergauss(i,j-1)*s1(2,1))+(hasilfiltergauss(i-1,j-1)*s1(1,1))+(hasilfiltergauss(i-1,j)*s1(1,2));
        end
    end
end
for i=1:m
    for j=1:n
        if i==1&&i~=m&&j==1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i,j+1)*s2(2,3))+(hasilfiltergauss(i+1,j)*s2(3,2))+(hasilfiltergauss(i+1,j+1)*s2(3,3));
        elseif i==1&&i~=m&&j~=1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i,j+1)*s2(2,3))+(hasilfiltergauss(i+1,j+1)*s2(3,3))+(hasilfiltergauss(i+1,j)*s2(3,2))+(hasilfiltergauss(i+1,j-1)*s2(3,1))+(hasilfiltergauss(i,j-1)*s2(2,1));
        elseif i==1&&i~=m&&j~=1&&j==n
             gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i,j-1)*s2(2,1))+(hasilfiltergauss(i+1,j)*s2(3,2))+(hasilfiltergauss(i+1,j-1)*s2(3,1));
        elseif i~=1&&i~=m&&j==1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i-1,j)*s2(1,2))+(hasilfiltergauss(i-1,j+1)*s2(1,3))+(hasilfiltergauss(i,j+1)*s2(2,3))+(hasilfiltergauss(i+1,j+1)*s2(3,3))+(hasilfiltergauss(i+1,j)*s2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j==n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i-1,j)*s2(1,2))+(hasilfiltergauss(i-1,j-1)*s2(1,1))+(hasilfiltergauss(i,j-1)*s2(2,1))+(hasilfiltergauss(i+1,j-1)*s2(3,1))+(hasilfiltergauss(i+1,j)*s2(3,2));
        elseif i~=1&&i~=m&&j~=1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i-1,j)*s2(1,2))+(hasilfiltergauss(i-1,j+1)*s2(1,3))+(hasilfiltergauss(i,j+1)*s2(2,3))+(hasilfiltergauss(i+1,j+1)*s2(3,3))+(hasilfiltergauss(i+1,j)*s2(3,2))+(hasilfiltergauss(i+1,j-1)*s2(3,1))+(hasilfiltergauss(i,j-1)*s2(2,1))+(hasilfiltergauss(i-1,j-1)*s2(1,1));
        elseif i~=1&&i==m&&j==1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i-1,j)*s2(1,2))+(hasilfiltergauss(i-1,j+1)*s2(1,3))+(hasilfiltergauss(i,j+1)*s2(2,3));
        elseif i~=1&&i==m&&j~=1&&j~=n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i,j-1)*s2(2,1))+(hasilfiltergauss(i-1,j-1)*s2(1,1))+(hasilfiltergauss(i-1,j)*s2(1,2))+(hasilfiltergauss(i-1,j+1)*s2(1,3))+(hasilfiltergauss(i,j+1)*s2(2,3));
        elseif i~=1&&i==m&&j~=1&&j==n
            gausssobel2(i,j)=(hasilfiltergauss(i,j)*s2(2,2))+(hasilfiltergauss(i,j-1)*s2(2,1))+(hasilfiltergauss(i-1,j-1)*s2(1,1))+(hasilfiltergauss(i-1,j)*s2(1,2));
        end
    end
end
%Calculating total gradient value from convolution of filtered image(by gaussian filter) with Sobel (s1 and s2)
gausssobel=sqrt((gausssobel1.*gausssobel1)+(gausssobel2.*gausssobel2));
%Find gradient direction value
direction=atan((gausssobel1)./(gausssobel2));
%Declaration new dummy variable
magnitudetotal=0;
%Calculating sum value from all element of gauss-sobel matrix
for i=1:m
    for j=1:n
        magnitudetotal=magnitudetotal+gausssobel(i,j);
    end
end
%Calculating mean value from gauss-sobel matrix
mean=magnitudetotal/(m*n);
%Find value of bottom threshold
thresholdbawah=0.33*mean;
%Find value of upper threshold
thresholdatas=1.66*mean;
%Checking all element of gauss-sobel matrix on threshold parameter, with condition:
%"gausssobel(i,j)>threshold atas" is the true edge, so the value doesn't change
%"thresholdbawah<gausssobel(i,j)<threshold atas" is the true edge if edge's neighbour have (at least) 1 element with the value is bigger than upper threshold
for i=1:m
    for j=1:n
       if i==1&&i~=m&&j==1&&j~=n
           if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
           elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i,j+1)>thresholdbawah||gausssobel(i+1,j+1)>thresholdbawah||gausssobel(i+1,j)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i==1&&i~=m&&j~=1&&j~=n
             if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i,j+1)>thresholdbawah||gausssobel(i+1,j+1)>thresholdbawah||gausssobel(i+1,j)>thresholdbawah||gausssobel(i+1,j-1)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i==1&&i~=m&&j~=1&&j==n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i+1,j)>thresholdbawah||gausssobel(i+1,j-1)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i~=m&&j==1&&j~=n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i-1,j+1)>thresholdbawah||gausssobel(i,j+1)>thresholdbawah||gausssobel(i+1,j+1)>thresholdbawah||gausssobel(i+1,j)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i~=m&&j~=1&&j==n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i+1,j)>thresholdbawah||gausssobel(i+1,j-1)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah||gausssobel(i-1,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i~=m&&j~=1&&j~=n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i-1,j+1)>thresholdbawah||gausssobel(i,j+1)>thresholdbawah||gausssobel(i+1,j+1)>thresholdbawah||gausssobel(i+1,j)>thresholdbawah||gausssobel(i+1,j-1)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah||gausssobel(i-1,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i==m&&j==1&&j~=n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i-1,j+1)>thresholdbawah||gausssobel(i,j+1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i==m&&j~=1&&j~=n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i-1,j+1)>thresholdbawah||gausssobel(i,j+1)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah||gausssobel(i-1,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        elseif i~=1&&i==m&&j~=1&&j==n
            if gausssobel(i,j)>thresholdatas
                gausssobel(i,j)=gausssobel(i,j);
             elseif gausssobel(i,j)>thresholdbawah&&gausssobel(i,j)<thresholdatas
                if gausssobel(i-1,j)>thresholdbawah||gausssobel(i,j-1)>thresholdbawah||gausssobel(i-1,j-1)>thresholdbawah
                    gausssobel(i,j)=gausssobel(i,j);
                else
                    gausssobel(i,j)=0;
                end
            end 
        end
    end
end

%%
%Show the results
figure(1)
imshow(gambar)
figure (2)
imshow(hasilr)
title('Edge Detection Image with Robert')
figure (3)
imshow(hasils)
title('Edge Detection Image with Sobel')
figure (4)
imshow(hasilp)
title('Gambar Edge Detection dengan Prewitt')
figure (5)
imshow(gausssobel)
title('Gambar Edge Detection dengan Canny')
figure (4)
imshow(hasilp)
title('Edge Detection Image with Prewitt')
figure (5)
imshow(gausssobel)
title('Edge Detection Image with Canny')
%