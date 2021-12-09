function [] = realtime_psd_RFSoC(duration,length,fs,fc)

if nargin<1
    duration = 5;
end

if nargin<2
    length = [];
end

if nargin<3
    fs = [];
end

if nargin<4
    fc = [];
end

tstop = now+seconds(duration);

% figure;
while now<tstop
    pwelch(recv_RFSoC(),length,[],fc,fs,'centered')
    drawnow
end

end