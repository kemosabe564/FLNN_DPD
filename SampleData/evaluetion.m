load 18_Nov_2021_11_31_16_+0100_itersdata.mat
iter = 1;
uBB = itersdata(iter).uBB_CFR;
yBB = itersdata(iter).yBB;
xBB = itersdata(iter).xBB;
U = MemoryPolynomial(uBB, 5, 3);
w = U\yBB;
% w = U\e, e = y - u
yest = U*w;

% dpd_Qmeasurements(yBB,yest,'NMSE')


figure;
subplot(2,2,1);
plot(abs(uBB), abs(yBB), 'o');
subplot(2,2,2);
plot([abs(uBB/rms(uBB)), abs(yBB/rms(yBB))]);
subplot(2,2,3);
pwelch([yBB yest],2^10,[],[],200e6,'centered');
subplot(2,2,4);
pwelch([uBB xBB],2^10,[],[],200e6,'centered');