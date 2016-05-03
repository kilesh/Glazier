lookup='';
log='';
dsimg='';

try    
lookup=handles.lookup;
dsimg=handles.dsimg;
catch
end
if isequal(lookup,'')
    log=strcat(log ,'lookup table not found or not imported');
    set(handles.stLog,'String',log);
elseif isequal(dsimg,'')
    log=strcat(log ,'img not found or not imported');
    set(handles.stLog,'String',log);
else
    log=strcat(log ,'ready to reconstruct');
    set(handles.stLog,'String',log);
    
    [h,w]=size(dsimg);
    h
    w
    
    
    a=1;
    window = zeros(4,4);
    weight=[0 2 4 8; 16 32 64 128;256 512 1024 2048;4096 8192 16384 32768];
    reimg= zeros(h-3,w-3);
    
   for height=1:h-3
       for width=1:w-3
    
           
           colomn1=a+width-1;
           c = [colomn1 colomn1+1 colomn1+2 colomn1+3];
           
          
           for i=1:4                          
               row=i+height-1;
               r = [row row row row];
               pixels = impixel(dsimg,c,r);
               new_row = pixels(:,1)';
               window(i,:)=new_row;

           end
            
           key=sum(sum(window.*weight))+1;
           reimg(height,width)=lookup(key,2);
           
           
           
       end
        totalstr=num2str(height);
           wait=waitbar(height / h,totalstr);
           close(wait);
   end
   reimg8=uint8(reimg);
   imwrite(reimg8,'isay1234usay1234.png');
   
end