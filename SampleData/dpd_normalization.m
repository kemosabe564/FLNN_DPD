function [output] = dpd_normalization(input,type)
    switch type
        case 'RMS'
          output = rms(input);  
    end
end