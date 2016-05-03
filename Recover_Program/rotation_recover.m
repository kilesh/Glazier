[h,w]=size(dsimg);
 h1=h;
 h1
 w1=w;
 w1

    window = zeros(4,4);
    weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];
    reimg= zeros(h-4,w-4);
    freimg= zeros(h-4,w-4);
    
    
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           reimg(height,width)=lookup(key,2)/4;
          
       end
        
           
   end
   
   dsimg90=rot90(dsimg);
   [h,w]=size(dsimg90);
    h2=h;
    h2
    w2=w;
    w2
   reimg90= zeros(h-4,w-4);
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg90(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           reimg90(height,width)=lookup(key,2)/4;
         
       end
        
           
   end 
   
   dsimg180=rot90(dsimg,2);
   [h,w]=size(dsimg180);
    h3=h;
    h3
    w3=w;
    w3
   reimg180= zeros(h-4,w-4);
   
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg180(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           reimg180(height,width)=lookup(key,2)/4;
          
       end
        
           
   end
   
   dsimg270=rot90(dsimg,3);
   [h,w]=size(dsimg270);
    h4=h;
    h4
    w4=w;
    w4
   reimg270= zeros(h-4,w-4);
   
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg270(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           reimg270(height,width)=lookup(key,2)/4;
          
       end
        
           
   end
   
   [h,w]=size(reimg);
    rh1=h;
    rh1
    rh1=w;
    rh1
    
    [h,w]=size(rot90(reimg90,-1));
    rh2=h;
    rh2
    rh2=w;
    rh2
    
    [h,w]=size(rot90(reimg180,-2));
    rh3=h;
    rh3
    rh3=w;
    rh3
    
    [h,w]=size(rot90(reimg270,-3));
    rh4=h;
    rh4
    rh4=w;
    rh4
    
   freimg=reimg+rot90(reimg90,-1)+rot90(reimg180,-2)+rot90(reimg270,-3);
   
   round(freimg);
   freimg=imcrop(freimg,[2,2,w1-7,h1-7]);
   [hf,wf]=size(freimg);
   hf
   wf
   reimg8=uint8(freimg);
   
   imwrite(reimg8,name);
   handles.reimg8=reimg8;
   guidata(hObject, handles);
   axes(handles.axes1);
   imshow(reimg8);
   axis off;