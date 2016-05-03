[h,w]=size(dsimg);
    h1=h;
    h1
    w1=w;
    w1
    window = zeros(4,4);
    weight=[1 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];
    reweight=[1/16 2/16 1/16 2/16 4/16 2/16 1/16 2/16 1/16 ] ;
    
    reimg= zeros(h-2,w-2);
    freimg= zeros(h-2,w-2);
    
    for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           remat=zeros(1,9);
           remat(1,1:9)=lookup(key,2:10).*reweight;
           reimg(height,width)=reimg(height,width)+remat(1,1)*4/10;
           reimg(height,width+1)=reimg(height,width+1)+remat(1,2)*4/10;
           reimg(height,width+2)=reimg(height,width+2)+remat(1,3)*4/10;
           reimg(height+1,width)=reimg(height+1,width)+remat(1,4)*4/10;
           reimg(height+1,width+1)=reimg(height+1,width+1)+remat(1,5)*4/10;
           reimg(height+1,width+2)=reimg(height+1,width+2)+remat(1,6)*4/10;
           reimg(height+2,width)=reimg(height+2,width)+remat(1,7)*4/10;
           reimg(height+2,width+1)=reimg(height+2,width+1)+remat(1,8)*4/10;
           reimg(height+2,width+2)=reimg(height+2,width+2)+remat(1,9)*4/10;
       end
        
           
    end
   
    dsimg90=rot90(dsimg);
   [h,w]=size(dsimg90);
    h2=h;
    h2
    w2=w;
    w2
    reimg90= zeros(h-2,w-2);
   
   for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg90(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           remat=zeros(1,9);
           remat(1,1:9)=lookup(key,2:10).*reweight;
           reimg90(height,width)=reimg90(height,width)+remat(1,1)*3/10;
           reimg90(height,width+1)=reimg90(height,width+1)+remat(1,2)*3/10;
           reimg90(height,width+2)=reimg90(height,width+2)+remat(1,3)*3/10;
           reimg90(height+1,width)=reimg90(height+1,width)+remat(1,4)*3/10;
           reimg90(height+1,width+1)=reimg90(height+1,width+1)+remat(1,5)*3/10;
           reimg90(height+1,width+2)=reimg90(height+1,width+2)+remat(1,6)*3/10;
           reimg90(height+2,width)=reimg90(height+2,width)+remat(1,7)*3/10;
           reimg90(height+2,width+1)=reimg90(height+2,width+1)+remat(1,8)*3/10;
           reimg90(height+2,width+2)=reimg90(height+2,width+2)+remat(1,9)*3/10;
       end
        
           
   end
   
   dsimg180=rot90(dsimg,2);
   [h,w]=size(dsimg180);
    h3=h;
    h3
    w3=w;
    w3
    reimg180= zeros(h-2,w-2);
    
    for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg180(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           remat=zeros(1,9);
           remat(1,1:9)=lookup(key,2:10).*reweight;
           reimg180(height,width)=reimg180(height,width)+remat(1,1)*2/10;
           reimg180(height,width+1)=reimg180(height,width+1)+remat(1,2)*2/10;
           reimg180(height,width+2)=reimg180(height,width+2)+remat(1,3)*2/10;
           reimg180(height+1,width)=reimg180(height+1,width)+remat(1,4)*2/10;
           reimg180(height+1,width+1)=reimg180(height+1,width+1)+remat(1,5)*2/10;
           reimg180(height+1,width+2)=reimg180(height+1,width+2)+remat(1,6)*2/10;
           reimg180(height+2,width)=reimg180(height+2,width)+remat(1,7)*2/10;
           reimg180(height+2,width+1)=reimg180(height+2,width+1)+remat(1,8)*2/10;
           reimg180(height+2,width+2)=reimg180(height+2,width+2)+remat(1,9)*2/10;
       end
        
           
    end
   
    dsimg270=rot90(dsimg,3);
   [h,w]=size(dsimg270);
    h4=h;
    h4
    w4=w;
    w4
    reimg270= zeros(h-2,w-2);
    
    for height=1:h-4
       for width=1:w-4
    
           window(1:4,1:4)=logical(dsimg270(height:height+3,width:width+3));
           key=sum(sum(window.*weight))+1;
           remat=zeros(1,9);
           remat(1,1:9)=lookup(key,2:10).*reweight;
           reimg270(height,width)=reimg270(height,width)+remat(1,1)*1/10;
           reimg270(height,width+1)=reimg270(height,width+1)+remat(1,2)*1/10;
           reimg270(height,width+2)=reimg270(height,width+2)+remat(1,3)*1/10;
           reimg270(height+1,width)=reimg270(height+1,width)+remat(1,4)*1/10;
           reimg270(height+1,width+1)=reimg270(height+1,width+1)+remat(1,5)*1/10;
           reimg270(height+1,width+2)=reimg270(height+1,width+2)+remat(1,6)*1/10;
           reimg270(height+2,width)=reimg270(height+2,width)+remat(1,7)*1/10;
           reimg270(height+2,width+1)=reimg270(height+2,width+1)+remat(1,8)*1/10;
           reimg270(height+2,width+2)=reimg270(height+2,width+2)+remat(1,9)*1/10;
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
    freimg=imcrop(freimg,[3,3,w1-7,h1-7]);
    reimg8=uint8(freimg);
   [h,w]=size(reimg8);
   h
   w
   imwrite(reimg8,name);
   handles.reimg8=reimg8;
   guidata(hObject, handles);
   axes(handles.axes1);
   imshow(reimg8);
   axis off;