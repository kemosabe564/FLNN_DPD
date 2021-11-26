function [U] = MemoryPolynomial(uBB,M,P)
    %MEMORYPOLYNOMIAL Example of memory polynomial
    U=zeros(length(uBB),(M)*(P));
    i=1;
    for m=0:M-1
       for p=0:P-1
            U(:,i)=circshift(uBB,m).*abs(circshift(uBB,m)).^p;
            i=i+1;
       end
    end    

    end
    
    

