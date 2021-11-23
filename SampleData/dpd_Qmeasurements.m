%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates NMSE and SNR between two complex data vectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Qmeasurement]=dpd_Qmeasurements(data1,data2,type)

error=data1-data2;

ndata1=dpd_normalization(data1,'RMS');
ndata2=dpd_normalization(data2,'RMS');
nerror=ndata1-ndata2;

switch type
    case 'NONORM+NMSE'
    num=mean( abs(error).^2);
    den=mean( abs(data1).^2 );
    Qmeasurement=10*log10(num/den);
    
    case {'NMSE','NORM+NMSE'}
    num=mean( abs(nerror).^2);
    den=mean( abs(ndata1).^2 );
    Qmeasurement=10*log10(num/den);

    case 'NMSE_LIN'
    num=mean( abs(nerror).^2);
    den=mean( abs(ndata1).^2 );
    Qmeasurement=num/den;
       
    case 'SNR'
    num=mean( abs(ndata1).^2);
    den=mean( abs(nerror).^2 );
    Qmeasurement=10*log10(num/den);

    case 'EVM'
    num=sqrt(mean(abs(nerror).^2));
    den=max(abs(ndata1));
    Qmeasurement=100*num/den;
    
    case 'NONORM+INMSE'
    num=abs(error).^2;
    den=mean(abs(data1).^2);
    Qmeasurement=(num./den);
    Qmeasurement=10*log10(Qmeasurement);
    
    
    case 'NORM+INMSE'
    num=abs(nerror).^2;
    den=mean(abs(ndata1).^2);
    Qmeasurement=(num./den);
    Qmeasurement=10*log10(Qmeasurement);
    
        
    case 'DNMSE' % dynamic NMSE
    range=5;
    N=floor(length(ndata1)/range);
    for n=0:(N-1)
        n1=1+n*range;
        n2=n1+range-1;
        
        num=mean( abs(nerror(n1:1:n2)).^2);
        den=mean( abs(ndata1(n1:1:n2)).^2 );
        nmse=10*log10(num/den);
        Qmeasurement(n+1,1)=nmse;
    end

    
    case {'NONORM+PNMSE'} % Percentatge NMSE
        num=abs(nerror).^2;
        den=abs(ndata1).^2;
        buffer=mean(num./den);
        Qmeasurement=10*log10(buffer);
    
    otherwise
end

end