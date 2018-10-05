%%
% purpose: calculate residual for beregning av masser og vetfraksjoner
% authors: ACGW and SB
% date: 15.april.2016

function L = residual(x)

m2=x(1);
m3=x(2);
m4=x(3);
m5=x(4);
m6=x(5);
m7=x(6);
m8=x(7);
m9=x(8);
wc2=x(9);
wh2=x(10);
wn2=x(11);
wo2=x(12);
wMEA3=x(13);
wMEA4=x(14);

L(1)=(m2*wn2)-(500*0.79);
L(2)=(m2*wo2)-(500*0.09);
L(3)=(m2*wh2)-(500*0.03);
L(4)=(36+0.0346*m3)/m4-0.0973;
L(5)=m4-m9-m3;
L(6)=(500+m3-m2-m4);
L(7)=(500-m2-m9);
L(8)=m9+m8*0.15-m8;
L(9)=1-wc2-wh2-wn2-wo2;
L(10)=m4-m5;
L(11)=m3-m6;
L(12)=m3-m7;
L(13)=m9-36; %36 kommer fra wcapture*(wc1*m1)
L(14)=((m3-0.0346*m3)*0.3)/m3-wMEA3;
L(15)=wMEA3*m3-wMEA4*m4;
end




