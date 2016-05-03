    [h,w]=size(dsimg);
    
    window = zeros(4,4);
    weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];
    reimg= zeros(h-4,w-4);
    
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           reimg(height,width)=lookup(key,2);
          
       end
        
           
   end
   reimg=imcrop(reimg,[2,2,w-7,h-7]);
   
   reimg8=uint8(reimg);
   [h,w]=size(reimg8);
   h
   w
   imwrite(reimg8,name);
   handles.reimg8=reimg8;
   guidata(hObject, handles);
   axes(handles.axes1);
   imshow(reimg8);
   axis off;