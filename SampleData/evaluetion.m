load 18_Nov_2021_11_31_16_+0100_itersdata.mat
iter = 1;
uBB = itersdata(iter).uBB_CFR;
yBB = itersdata(iter).yBB;
xBB = itersdata(iter).xBB;
U1 = MemoryPolynomial(uBB,5,3);
w1 = U1\yBB;
% w = U\e, e = y - u
yest1 = U1*w1;

% dpd_Qmeasurements(yBB,yest1,'NONORM+NMSE')

U2 = GMemoryPolynomial(uBB,5,3,2,3,3,2,2,2);
w2 = U2\yBB;
% w = U\e, e = y - u
yest2 = U2*w2;

figure;
subplot(2,2,1);
plot(abs(uBB), abs(yBB), 'o');
subplot(2,2,2);
plot([abs(uBB/rms(uBB)), abs(yBB/rms(yBB))]);
subplot(2,2,3);
pwelch([yBB yest1 yest2],2^10,[],[],200e6,'centered');
legend;
subplot(2,2,4);
pwelch([uBB xBB],2^10,[],[],200e6,'centered');