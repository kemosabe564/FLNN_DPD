function [U] = MemoryPolynomial(uBB,M,P)
%MEMORYPOLYNOMIAL Example of memory polynomial
U=zeros(length(uBB),(M+1)*(P+1));
    i=1;
    for m=0:M
       for p=0:P
            U(:,i)=circshift(uBB,m).*abs(circshift(uBB,m)).^p;
            i=i+1;
       end
    end

end

