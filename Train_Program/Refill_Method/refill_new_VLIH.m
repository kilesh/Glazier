clc;clear all;close all;

prompt = 'What is the input lookup table: ';
INPUTH = input(prompt);

load(INPUTH,'lookup');

d=size(lookup);
d
finalval=zeros(1,9);
w=[1/81 2/81 4/81 2/81 2/81 4/81 8/81 4/81 4/81 8/81 16/81 8/81 2/81 4/81 8/81 4/81] ;
count=0;
for i=1:65536
   
    if lookup(i,11)==0
    finalval=zeros(1,9);   
    refill=i-1;
    
    
    brefill=de2bi(refill,16);
    
        
    for p=0:15
        debrefill=bitxor(brefill,de2bi(2^p,16));
        
%         if lookup(bi2de(debrefill)+1,11)==0
%          debrefill
%          brefill
%          refill
%          count=count+1;
%          count
%         end    
%         count=0;
        finalval(1,1:9)=finalval(1,1:9)+lookup(bi2de(debrefill),2:10)*w(p+1);
        
    
    end
    finalval=round(finalval);
    finalval
    
    for y=2:10
    lookup(i,y)=uint8(finalval(1,y-1));
    end
    lookup(i,11)=lookup(i,11)+1;
    
    end
    
    
end