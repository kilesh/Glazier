    [h,w]=size(dsimg);
    h
    w
    window = zeros(4,4);
    weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];
    reweight=[1/16 2/16 1/16 2/16 4/16 2/16 1/16 2/16 1/16 ] ;
    
    reimg= zeros(h-2,w-2);
    
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           remat=zeros(1,9);
           remat(1,1:9)=lookup(key,2:10).*reweight;
           reimg(height,width)=reimg(height,width)+remat(1,1);
           reimg(height,width+1)=reimg(height,width+1)+remat(1,2);
           reimg(height,width+2)=reimg(height,width+2)+remat(1,3);
           reimg(height+1,width)=reimg(height+1,width)+remat(1,4);
           reimg(height+1,width+1)=reimg(height+1,width+1)+remat(1,5);
           reimg(height+1,width+2)=reimg(height+1,width+2)+remat(1,6);
           reimg(height+2,width)=reimg(height+2,width)+remat(1,7);
           reimg(height+2,width+1)=reimg(height+2,width+1)+remat(1,8);
           reimg(height+2,width+2)=reimg(height+2,width+2)+remat(1,9);
       end
        
           
   end
   reimg=imcrop(reimg,[3,3,w-7,h-7]);
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