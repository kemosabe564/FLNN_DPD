load 18_Nov_2021_11_31_16_+0100_itersdata.mat
iter = 1;
uBB = itersdata(iter).uBB_CFR;
yBB = itersdata(iter).yBB;
xBB = itersdata(iter).xBB;
U1 = MemoryPolynomial(uBB,5,3);
w1 = U1\yBB;
% w = U\e, e = y - u
yest1 = U1*w1;


U2 = GMemoryPolynomial(uBB,5,3,2,3,3,2,2,2);
w2 = U2\yBB;
yest2 = U2*w2;

U3 = PPN(uBB,3);
w3 = U3\yBB;
% w = U\e, e = y - u
yest3 = U3*w3;

U4 = FLNN(uBB,3);
w4 = U4\yBB;
yest4 = U4*w4;

figure;
subplot(2,3,1);
plot(abs(uBB), abs(yBB), 'o');
subplot(2,3,2);
plot([abs(uBB/rms(uBB)), abs(yBB/rms(yBB))]);
subplot(2,3,3);
pwelch([yBB yest1 yest2 yest3 yest4],2^10,[],[],200e6,'centered');
legend;
subplot(2,3,4);
pwelch([uBB xBB],2^10,[],[],200e6,'centered');
subplot(2,3,5);
plot(abs(uBB), [abs(yBB) abs(yest1) abs(yest2) abs(yest3) abs(yest4)], 'o');
legend;
subplot(2,3,6);
% pwelch([uBB xBB],2^10,[],[],200e6,'centered');



dpd_Qmeasurements(yBB,yest1,'NONORM+NMSE')
dpd_Qmeasurements(yBB,yest2,'NONORM+NMSE')
dpd_Qmeasurements(yBB,yest3,'NONORM+NMSE')
dpd_Qmeasurements(yBB,yest4,'NONORM+NMSE')
