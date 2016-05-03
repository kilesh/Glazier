%Author : Kyle Suen
%Department of Electronic and Information engineering
%The Hong Kong Polytechnic University
%Hong Kong



clc;clear all;close all;

prompt = 'What is the input halftone file name: ';
INPUTH = input(prompt);
prompt = 'What is the input greyscale file name: ';
INPUTG = input(prompt);
in_imgh = imread(INPUTH);
in_imgg = imread(INPUTG);
load('lookup.mat','lookup');
colomn_offset=0;
row_offset=0;
for l=1:509

    for h=1:765

        a=1;b=2;e=3;d=4;
        colomn1=a+colomn_offset;
        colomn2=b+colomn_offset;
        colomn3=e+colomn_offset;
        colomn4=d+colomn_offset;
        c = [colomn1 colomn2 colomn3 colomn4];
        window = zeros(4,4);
        tic
            for i=1:4
               row=i+row_offset;
                r = [row row row row];
               pixels = impixel(in_imgh,c,r);
               new_row = pixels(:,1)';

               window(i,:)=window(i,:)+new_row;

               if i==3
                  pixels_g = impixel(in_imgg,c,r);
                  val = pixels_g(3,1);

               end

            end
        

        key = window(1,1) * 2^0 + window(1,2) * 2^1 + window(1,3) * 2^2 + window(1,4) * 2^3 + window(2,1) * 2^4 + window(2,2) * 2^5 + window(2,3) * 2^6 + window(2,4) * 2^7 + window(3,1) * 2^8 + window(3,2) * 2^9 + window(3,3) * 2^10 + window(3,4) * 2^11 + window(4,1) * 2^12 + window(4,2) * 2^13 + window(4,3) * 2^14 + window(4,4) * 2^15;
        key_s=key+1;
        t=toc;
        t
        
        mean_val = lookup(key_s,2);
        count = lookup(key_s,3);
        lookup(key_s,3) = lookup(key_s,3) + 1;
        lookup(key_s,2) = round((mean_val * count + val) / lookup(key_s,3));
        colomn_offset=colomn_offset+1;
        if h==100||h==200||h==300||h==400||h==500||h==600||h==700
            h
        end
    end
    colomn_offset=0;
    row_offset=row_offset+1;
    l
end
