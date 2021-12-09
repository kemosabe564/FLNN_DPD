function [yBB,rxdata]=recv_RFSoC(PARAM)
% disp('DOING get_RFSoC');

url = "http://192.168.3.1:9092/rx";
rxdata = loadweb(url);
yBB = rxdata.yBB;

% Estimate the received power at the ADC port (Calibrated with a Tone)
adc2_calibration = 1.83;
rxdata.Power = 10*log10( norm(yBB)^2/100/length(yBB)) + 30 + adc2_calibration;

% disp('ENDED get_RFSoC');
end

function data = loadweb(url)
    websave('rxbuf.mat',url);
    data = load('rxbuf.mat');
    delete('rxbuf.mat');
end
