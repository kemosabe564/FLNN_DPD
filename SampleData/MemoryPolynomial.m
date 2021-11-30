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
    
    Hi, I have some problem with my right eye.
The problem is that my right eye can still see things but with whole picture is blurry, or a bit "somkey", I may decribe it inaccurately. Also, when I worked on a computer screen after a few hours, the "somkey" eyesight happen again. I had this symptoms from around 27.11.2021, and this symptoms sometimes was better a bit, and sometimes was worse, but it's still there.
I don't have any test or talk to any doctor yet, can you recommand me to do next?

