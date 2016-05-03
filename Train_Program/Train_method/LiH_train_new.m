clc;clear all;close all;

prompt = 'What is the input halftone file name: ';
INPUTH = input(prompt);
prompt = 'What is the input greyscale file name: ';
INPUTG = input(prompt);
prompt = 'What is the input lookup table name: ';
INPUTL = input(prompt);
prompt = 'What is the output lookup table name: ';
OUTPUTL = input(prompt);
imgh = imread(INPUTH);
imgg = imread(INPUTG);
load(INPUTL,'lookup');


[h,w]=size(imgh);
window = zeros(4,4);
weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];


for loop=1:65536
    if lookup(loop,2)~=0
    lookup(loop,2)=lookup(loop,2)*lookup(loop,3); 
    end
end

for height=1:h-3

    for width=1:w-3
        
        window(1:4,1:4)=imgh(height:height+3,width:width+3);          
        val=double(imgg(height+2,width+2));
        key=sum(sum(window.*weight))+1;
        
        
        lookup(key,3) = lookup(key,3)+1;
        lookup(key,2) = lookup(key,2)+val;
        
        
    end
    height
end
for loop=1:65536
    if lookup(loop,2)~=0
    lookup(loop,2)=lookup(loop,2)/lookup(loop,3); 
    end
end

save(OUTPUTL,'lookup');
