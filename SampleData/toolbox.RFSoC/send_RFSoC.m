function [res,Pdac1,Pdac2]=send_RFSoC(PARAM,ch1,ch2)
% disp('DOING send_RFSoC');

url = "http://192.168.3.1:9092/tx";

% Normalize Amplitude to one
ampch1 = abs(ch1);
ampch2 = abs(ch2);
gt1ch1 = ampch1>1;
gt1ch2 = ampch2>1;
ch1(gt1ch1) = ch1(gt1ch1)/ampch1(gt1ch1);
ch2(gt1ch2) = ch2(gt1ch2)/ampch2(gt1ch2);

% Estimate the DACs output power in dBm (Calibrated at 2 GHz with a Tone)
ch1_calibration = -14.20;
ch2_calibration = -14.00;
Pdac1 = 10*log10( norm(ch1)^2/100/length(ch1)) + 30 + ch1_calibration;
Pdac2 = 10*log10( norm(ch2)^2/100/length(ch2)) + 30 + ch2_calibration;

clear Params; % PARAM not used yet.

save('txbuf.mat');
[~,res]=dos("curl -s -F file=@./txbuf.mat "+url);

% disp('ENDED send_RFSoC');
end
