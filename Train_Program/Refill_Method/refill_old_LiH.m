%Author : Kyle Suen
%Department of Electronic and Information engineering
%The Hong Kong Polytechnic University
%Hong Kong

clc;clear all;close all;

prompt = 'What is the input lookup table: ';
INPUTH = input(prompt);

load(INPUTH,'lookup');

d=size(lookup);
d


for i=1:65536
   
    if lookup(i,3)==0
        
    count=1;
    
        while lookup(i+count,3)==0 
            count=count+1;
            
        end
        
    
    
    up = lookup(i-1,2);
    down = lookup(i+count,2);
    increment = (down - up)/ (count+1);
    
        for a=0:count
        lookup(i+a,2) = round(lookup(i-1,2) + (increment*(a+1)));
        lookup(i+a,3) = lookup(i+a,3) + 1;
        end
    end
    
    
end