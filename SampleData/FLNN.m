function [U] = FLNN(uBB,M)
    % FLNN Example of functional link neural network
    % M is for the memory depth, also, no weights are considered now
    % input is uBB, which will be converted into X 
    % where x1 can be circshift(uBB,1), xM can be circshift(uBB,M)
    
    % under the processing, the y1 comes from x1, y2 is cos(x1), y3 is sin(x1)
    
    % output´s shape is (M,1), from y1 to yM
    
    My = 3*M;
    U=zeros(length(uBB),My);
    i=0;   
    for m=0:M-1
        U(:,i+1)=circshift(uBB,m);
        U(:,i+2)=cos(2*pi*(circshift(uBB,m)));
        U(:,i+3)=sin(2*pi*(circshift(uBB,m)));
        
        i=i+3;
    end

    
end