function [U] = FLNN(uBB,Ma,Pa,Mb,Pb,Lb,Mc,Pc,Lc)
    %MEMORYPOLYNOMIAL Example of memory polynomial
    U=zeros(length(uBB),((Ma*Pa)+(Mb*Pb*Lb)+(Mc*Pc*Lc)));
    i=1;   
%     % MP part
%     for m=0:Ma-1
%        for p=0:Pa-1
%             U(:,i)=circshift(uBB,m).*(abs(circshift(uBB,m)).^p);
%             i=i+1;
%        end
%     end 
%     
%     % lagging part
%     for m=0:Mb-1
%        for p=1:Pb
%            for l=1:Lb
% %                if(m+l == m && m < Ma)
% %                    continue;
% %                end
%                 U(:,i)=circshift(uBB,m).*(abs(circshift(uBB,m+l)).^p);
%                 i=i+1;
%            end  
%        end
%     end 
%     
%     % leading part
%     for m=0:Mc-1
%        for p=1:Pc
%            for l=1:Lc
%                if(m-l == m && m < Ma)
%                    continue;
%                end
%                 U(:,i)=circshift(uBB,m).*(abs(circshift(uBB,m-l)).^p);
%                 i=i+1;
%            end  
%        end
%     end 
    
end