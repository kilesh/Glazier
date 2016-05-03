clc;clear all;close all;


prompt = 'What is the input image name: ';
INPUTH = input(prompt);
prompt = 'What is the output name: ';
OUTPUTH = input(prompt);

in_img = imread(INPUTH);
in_img = double(in_img);
in_img2= in_img.^2;
[h,w]=size(in_img2);
h1=round(h/3);
w1=round(w/3);
energy=zeros(h1,w1);

for height=0:h1-2
    for width=0:w1-1
        energy(height+1,width+1)=sum(sum(in_img2(1+height*3:3+height*3,1+width*3:3+width*3)));
    end
end

for width=0:w1-1
    energy(h1,width+1)=sum(sum(in_img2(h-2:h,1+width*3:3+width*3)));
end
%mesh(energy)

save(OUTPUTH,'energy');
