clc;clear all;close all;


prompt = 'What is the input parameter name: ';
INPUTH = input(prompt);
prompt = 'What is the input parameter type: ';
type = input(prompt);

load(INPUTH);
pass=0;



    
switch(type)
    
    case 'energy'
    [h,w]=size(energy);
    for height=1:h
        for width=1:w
            
            if energy(height,width)>550.0
                pass=pass+1;
                
            end
        end
    end
    unpass=h*w-pass;
    pass
    unpass
    pass/unpass
    case 'sd'
    [h,w]=size(sd);
    for height=1:h
        for width=1:w
            
            if sd(height,width)>20.0
                pass=pass+1;
                
            end
        end
    end
    unpass=h*w-pass;
    pass
    unpass
    pass/unpass
    otherwise
        
end
