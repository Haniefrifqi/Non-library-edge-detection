%%
%%Dibuat oleh: Hanief Rifqi Murdaka
close all;
clear;
clc;
%load gambar
gambar=imread('D:\Proyek\6. Lain-lain\Github\1. Edge Detection with Matlab\Metabee.jpg');
%membuat channel RGB ke channel gray scale
grey= (0.2989 * double(gambar(:,:,1)) + 0.5870 * double(gambar(:,:,2)) + 0.1140 * double(gambar(:,:,3)))/255;
%mencari ukuran matrix dari gambar
[m,n]=size(grey);
%%
%%Edge Detection dengan robert
%deklarasi matrix tampungan ketika matrix gambar channel gray dikonvolusi dengan robert 
hasilr1=zeros(m,n);
hasilr2=zeros(m,n);
%deklarasi matrix tampungan untuk hasil perhitungan gradien total
hasilr=zeros(m,n);
%r1=kernel robert sumbu x; r2=kernel robert sumbu y
r1=([-1 0;0 1])./2;
r2=([0 -1;1 0])./2;
%Code konvolusi matrix gambar dengan matrix kernel robert r1
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
%Code konvolusi matrix gambar dengan matrix kernel robert r2
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
%Code mencari nilai gradien total dari robert r1 dan robert r2
for i=1:m
    for j=1:n
        hasilr(i,j)=abs(hasilr1(i,j))+abs(hasilr2(i,j));
    end
end

%%
%%Edge Detection dengan Sobel
%deklarasi matrix tampungan ketika matrix gambar channel gray dikonvolusi dengan sobel
hasils1=zeros(m,n);
hasils2=zeros(m,n);
%deklarasi matrix tampungan untuk hasil perhitungan gradien total
hasils=zeros(m,n);
%s1=kernel sobel sumbu x; s2= kernel sobel sumbu y
s1=([-1 -2 -1;0 0 0;1 2 1])./8;
s2=([-1 0 1; -2 0 2; -1 0 1])./8;
%Code konvolusi matrix gambar dengan matrix kernel sobel s1
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
%Code konvolusi matrix gambar dengan matrix kernel sobel s2
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
%Code mencari nilai gradien total dari sobel s1 dan sobel s2
for i=1:m
    for j=1:n
        hasils(i,j)=abs(hasils1(i,j))+abs(hasils2(i,j));
    end
end

%%
%%Edge Detection Menggunakan Prewitt
%deklarasi matrix tampungan ketika matrix gambar channel gray dikonvolusi dengan prewitt 
hasilp1=zeros(m,n); 
hasilp2=zeros(m,n);
%deklarasi matrix tampungan untuk hasil perhitungan gradien total
hasilp=zeros(m,n);
%p1=kernel prewitt sumbu x; p2=kernel prewitt sumbu y
p1=([1 0 -1;1 0 -1;1 0 -1])./6;
p2=([1 1 1;0 0 0;-1 -1 -1])./6;
%Code konvolusi matrix gambar dengan matrix kernel prewitt p1
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
%Code konvolusi matrix gambar dengan matrix kernel prewitt p2
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
%Code mencari nilai gradien total dari prewitt p1 dan prewitt p2
for i=1:m
    for j=1:n
        hasilp(i,j)=abs(hasilp1(i,j))+abs(hasilp2(i,j));
    end
end

%%
%%Edge Detection Menggunakan Canny
%deklarasi matrix hasil konvolusi matrix gambar channel grey dengan matrix filter gauss
hasilfiltergauss=zeros(m,n);
%deklarasi matrix tampungan ketika matrix hasil filter gauss dikonvolusi dengan sobel 
gausssobel1=zeros(m,n);
gausssobel2=zeros(m,n);
%deklarasi matrix tampungan untuk hasil perhitungan gradien total
gausssobel=zeros(m,n);
%mencari nilai direction dari gradien x dan y
direction=zeros(m,n);
%deklarasi kernel filter gauss
gauss=[1 2 1;2 4 2;1 2 1];
%code konvolusi matrix filter gauss dengan matrix channel gray gambar
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
%code konvolusi matrix hasil filterisasi gauss dengan matrix sobel s1 dan s2
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
%mencari nilai gradien total dari hasil konvolusi hasil filter gauss dengan sobel s1 dan s2
gausssobel=sqrt((gausssobel1.*gausssobel1)+(gausssobel2.*gausssobel2));
%mencari nilai direction gradien
direction=atan((gausssobel1)./(gausssobel2));
%deklarasi variable bantu
magnitudetotal=0;
%mencari nilai total/sum dari isi elemen matrix gaussobel
for i=1:m
    for j=1:n
        magnitudetotal=magnitudetotal+gausssobel(i,j);
    end
end
%mencari nilai mean dari matrix gausssobel
mean=magnitudetotal/(m*n);
%mencari nilai threshold bawah
thresholdbawah=0.33*mean;
%mencari nilai threshold atas
thresholdatas=1.66*mean;
%pengecekan nilai elemen matrix gausssobel pada batas ambang threshold,dimana :
%gausssobel(i,j)>threshold atas, maka merupakan edge sebenarnya sehingga nilainya tidak dirubah
%thresholdbawah<gausssobel(i,j)<threshold atas, merupakan edge sebenarnya hanya jika edge tetangganya ada yang bernilai lebih dari threshold atas
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
%menampilkan hasil
figure(1)
imshow(gambar)
figure (2)
imshow(hasilr)
title('Gambar Edge Detection dengan Robert')
figure (3)
imshow(hasils)
title('Gambar Edge Detection dengan Sobel')
figure (4)
imshow(hasilp)
title('Gambar Edge Detection dengan Prewitt')
figure (5)
imshow(gausssobel)
title('Gambar Edge Detection dengan Canny')
figure (4)
imshow(hasilp)
title('Gambar Edge Detection dengan Prewitt')
figure (5)
imshow(gausssobel)
title('Gambar Edge Detection dengan Canny')