



clc;
close all;
clear all;
prompt = 'What is the input image name: ';
INPUTH = input(prompt);
prompt = 'What is the output image name: ';
OUTPUTH = input(prompt);
I=imread(INPUTH);

 % convert the image to grey 

A = fft2(double(I)); % compute FFT of the grey image
A1=fftshift(A); % frequency scaling


% Gaussian Filter Response Calculation

[M N]=size(A); % image size
R=40; % filter size parameter 
X=0:N-1;
Y=0:M-1;
[X Y]=meshgrid(X,Y);
Cx=0.5*N;
Cy=0.5*M;
Lo=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
Hi=1-Lo;

for height=1:M-1
    for width=1:N-1
        if Hi(height,width)<0.9
            Hi(height,width)=0;
        end
        if Hi(height,width)>0.9
            Hi(height,width)=1;
        end
    end
end

 
% High pass filter=1-low pass filter

% Filtered image=ifft(filter response*fft(original image))



K=A1.*Hi;
K1=ifftshift(K);
B2=ifft2(K1);

BB2=uint8(B2);
% psnr=psnr(I,BB2);
% psnr
% snr=snr(I,BB2);
% snr



  
  
aa1=abs(K);
%figure(2)
F1 = log(aa1+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
F = mat2gray(F1); % Use mat2gray to scale the image between 0 and 1

%imshow(F,[]); % Display the result
imwrite(F,OUTPUTH);

