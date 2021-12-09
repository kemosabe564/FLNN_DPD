function [U] = PPN(uBB,M)
    % PPN Example of polynomial perceptron network
    % M is for the memory depth, also, no weights are considered now
    % input is uBB, which will be converted into X 
    % where x1 can be circshift(uBB,1), xM can be circshift(uBB,M)
    
    % under the processing, the y1 comes from x1, y2 is x1^2, y3 is x1*x2,
    % y6 is x2*x3
    
    % output´s shape is (M,1), from y1 to yM
    
    My = 3*M;
    U=zeros(length(uBB),My);
    i=0;   
    for m=0:M-1
        U(:,i+1)=circshift(uBB,m);
        U(:,i+2)=circshift(uBB,m).^2;
        U(:,i+3)=circshift(uBB,m).*circshift(uBB,m+1);
        
        i=i+3;
    end 

    
end