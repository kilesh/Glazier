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
swindow = zeros(3,3);
weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];


for loop=1:65536
    if lookup(loop,11)~=0
        for x=2:10
            lookup(loop,x)=lookup(loop,x)*lookup(loop,11);
        end
    end
end

for height=1:h-3

    for width=1:w-3
        
        window(1:4,1:4)=imgh(height:height+3,width:width+3);          
        swindow(1:3,1:3)=double(imgg(height+1:height+3,width+1:width+3));
        key=sum(sum(window.*weight))+1;
        
        
        lookup(key,11) = lookup(key,11)+1;
        
            lookup(key,2) = lookup(key,2)+swindow(1,1);
            lookup(key,3) = lookup(key,3)+swindow(1,2);
            lookup(key,4) = lookup(key,4)+swindow(1,3);
            lookup(key,5) = lookup(key,5)+swindow(2,1);
            lookup(key,6) = lookup(key,6)+swindow(2,2);
            lookup(key,7) = lookup(key,7)+swindow(2,3);
            lookup(key,8) = lookup(key,8)+swindow(3,1);
            lookup(key,9) = lookup(key,9)+swindow(3,2);
            lookup(key,10) = lookup(key,10)+swindow(3,3);
            
        
        
    end
    height
end

imgh90=rot90(imgh);
imgg90=rot90(imgg);
[h,w]=size(imgh90);

for height=1:h-3

    for width=1:w-3
        
        window(1:4,1:4)=imgh90(height:height+3,width:width+3);          
        swindow(1:3,1:3)=double(imgg90(height+1:height+3,width+1:width+3));
        key=sum(sum(window.*weight))+1;
        
        
        lookup(key,11) = lookup(key,11)+1;
        
            lookup(key,2) = lookup(key,2)+swindow(1,1);
            lookup(key,3) = lookup(key,3)+swindow(1,2);
            lookup(key,4) = lookup(key,4)+swindow(1,3);
            lookup(key,5) = lookup(key,5)+swindow(2,1);
            lookup(key,6) = lookup(key,6)+swindow(2,2);
            lookup(key,7) = lookup(key,7)+swindow(2,3);
            lookup(key,8) = lookup(key,8)+swindow(3,1);
            lookup(key,9) = lookup(key,9)+swindow(3,2);
            lookup(key,10) = lookup(key,10)+swindow(3,3);
            
        
        
    end
    height
end

imgh180=rot90(imgh,2);
imgg180=rot90(imgg,2);
[h,w]=size(imgh180);

for height=1:h-3

    for width=1:w-3
        
        window(1:4,1:4)=imgh180(height:height+3,width:width+3);          
        swindow(1:3,1:3)=double(imgg180(height+1:height+3,width+1:width+3));
        key=sum(sum(window.*weight))+1;
        
        
        lookup(key,11) = lookup(key,11)+1;
        
            lookup(key,2) = lookup(key,2)+swindow(1,1);
            lookup(key,3) = lookup(key,3)+swindow(1,2);
            lookup(key,4) = lookup(key,4)+swindow(1,3);
            lookup(key,5) = lookup(key,5)+swindow(2,1);
            lookup(key,6) = lookup(key,6)+swindow(2,2);
            lookup(key,7) = lookup(key,7)+swindow(2,3);
            lookup(key,8) = lookup(key,8)+swindow(3,1);
            lookup(key,9) = lookup(key,9)+swindow(3,2);
            lookup(key,10) = lookup(key,10)+swindow(3,3);
            
        
        
    end
    height
end

imgh270=rot90(imgh,3);
imgg270=rot90(imgg,3);
[h,w]=size(imgh270);

for height=1:h-3

    for width=1:w-3
        
        window(1:4,1:4)=imgh270(height:height+3,width:width+3);          
        swindow(1:3,1:3)=double(imgg270(height+1:height+3,width+1:width+3));
        key=sum(sum(window.*weight))+1;
        
        
        lookup(key,11) = lookup(key,11)+1;
        
            lookup(key,2) = lookup(key,2)+swindow(1,1);
            lookup(key,3) = lookup(key,3)+swindow(1,2);
            lookup(key,4) = lookup(key,4)+swindow(1,3);
            lookup(key,5) = lookup(key,5)+swindow(2,1);
            lookup(key,6) = lookup(key,6)+swindow(2,2);
            lookup(key,7) = lookup(key,7)+swindow(2,3);
            lookup(key,8) = lookup(key,8)+swindow(3,1);
            lookup(key,9) = lookup(key,9)+swindow(3,2);
            lookup(key,10) = lookup(key,10)+swindow(3,3);
            
        
        
    end
    height
end



for loop=1:65536
    if lookup(loop,11)~=0
        for y=2:10
            lookup(loop,y)=lookup(loop,y)/lookup(loop,11);
        end 
    end
end

save(OUTPUTL,'lookup');