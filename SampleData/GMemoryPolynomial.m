function [U] = GMemoryPolynomial(uBB,Ma,Pa,Mb,Pb,Lb,Mc,Pc,Lc)
    %MEMORYPOLYNOMIAL Example of memory polynomial
    U=zeros(length(uBB),((Ma*Pa)+(Mb*Pb*Lb)+(Mc*Pc*Lc)));
    i=1;   
    % MP part
    for m=0:Ma-1
       for p=0:Pa-1
            U(:,i)=circshift(uBB,m).*abs(circshift(uBB,m)).^p;
            i=i+1;
       end
    end 
    
    % lagging part
    for m=0:Mb-1
       for p=0:Pb-1
           for l=0:Lb-1
                U(:,i)=circshift(uBB,m).*abs(circshift(uBB,m-l)).^p;
                i=i+1;
           end  
       end
    end 
    
    % leading part
    for m=0:Mc-1
       for p=0:Pc-1
           for l=0:Lc-1
                U(:,i)=circshift(uBB,m).*abs(circshift(uBB,m+l)).^p;
                i=i+1;
           end  
       end
    end 
    
    end