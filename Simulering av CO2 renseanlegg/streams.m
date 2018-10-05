% purpose: simulere str?mmene i CO2-fangst prosessen
% authors: SB
% date: 15.april.2016

run('constants3.m') %Henter konstanter fra konstantfila

    %m2 m3 m4 m5 m6 m7 m8 m9 wc2 wh2 wn2  wo2 wMEA3 wMEA4
x0=[450 45 55 55 45 45 10 8 0.1 0.05 0.85 0.05 0.28 0.25]; 
x = fsolve(@residual, x0);

%% stream simulator
%kjente verider
m1    = 500;   %                           kg/s mass flow (total), stream 1
m4    = x(3);  %                           kg/s mass flow (total), stream 4
m5    = x(4);  %                           kg/s mass flow (total), stream 5
m6    = x(5);  %                           kg/s mass flow (total), stream 6
m7    = x(6);  %                           kg/s mass flow (total), stream 7
m8    = x(7);  %                           kg/s mass flow (total), stream 8
m9    = x(8);  %                           kg/s mass flow (total), stream 9
wc1   = 0.09;  %                           mass fraction CO2, stream 1
wh1   = 0.03;  %                           mass fraction H2O, stream 1
wn1   = 0.79;  %                           mass fraction N2,  stream 1
wo1   = 0.09;  %                           mass fraction O2,  stream 1
nc8   = 0.7;   %                           molar fraction CO2, stream 8
wc8   = getWtFrac(nc8,'CO2','H2O'); %      mass fraction CO2, stream 8
wh8   = 0.15;                       %      mass fraction H2O, stream 8
wc4   = getWtFracCO2(alpha4);       %      mass fraction CO2, stream 4
wc3   = getWtFracCO2(alpha3);       %      mass fraction CO2, stream 3
wMEA4 = x(14);                      %      mass fraction MEA, stream 4
wMEA3 = x(13);                      %      mass fraction MEA, stream 4
T(7)  = 70;                         % OBS! se residual2.m for forklaring 
c  = 273;                           %      brukes til ? omgj?re celsius til kelvin
T(12)=T(9);                         %      oppgitt 

%% DEl 2


label_1={'total mass','CO2 gas','H2O gas','N2 gas','O2 gas','MEA', 'CO2'};
stream_1=[...
m1,wc1,wh1,wn1,wo1,0,0;x(1),x(9),x(10),x(11),x(12),0,0;...
x(2),0,0,0,0,wMEA3,wc3;...
x(3),0,0,0,0,wMEA4,wc4;...
x(4),0,0,0,0,wMEA4,wc4;...
x(5),0,0,0,0,wMEA3,wc3;...
x(6),0,0,0,0,wMEA3,wc3;...
x(7),0.85,0.15,0,0,0,0;...
x(8),1,0,0,0,0,0];
%Del_2=[h;num2cell(stream)] 

%% DEl 3


h1 =  hf(1)*wc1+hf(2)*wh1+hf(3)*wn1+hf(4)*wo1...
      +cpg(1)*(313-298)+cpg(2)*(313-298)...
      +cpg(3)*(313-298)+cpg(4)*(313-298);

h2 =  hf(1)*x(9)+hf(2)*x(10)+hf(3)*x(11)+hf(4)*x(12)...
      +cpg(1)*(313-298)+cpg(2)*(313-298)...
      +cpg(3)*(313-298)+cpg(4)*(313-298);

h3 = (1-wc3)*(hfsol+getEnthalpyMEAsol(T(3)))...
     +wc3*(hf(1)+getIntCpCO2(T(3))...
     +wc3*habs_m/Mw(1)*1000);

h4 = (1-wc4)*(hfsol+getEnthalpyMEAsol(T(4)))...
     +wc4*(hf(1)+getIntCpCO2(T(4))...
     +wc3*habs_m/Mw(1)*1000);

h5 = (1-wc4)*(hfsol+getEnthalpyMEAsol(T(5)))...
     +wc4*(hf(1)+getIntCpCO2(T(5))...
     +wc3*habs_m/Mw(1)*1000);

h6 = (1-wc3)*(hfsol+getEnthalpyMEAsol(T(6)))...
     +wc3*(hf(1)+getIntCpCO2(T(6))...
     +wc3*habs_m/Mw(1)*1000);

H7 = m6*h6 + m4*h4 - m5*h5;

h7=H7/m7;

h8 = (hf(1)+cpg(1)*(T(8)-Tref_K))*0.85...
     + (hf(2)+cpg(2)*(T(8)-Tref_K))*0.15; %CO2(g) + H2O(g)

h9 = (hf(1)+cpg(1)*(T(9)-Tref_K))*1; %CO2(g) 

h12 = (hf(1)+cpg(1)*(T(12)-(Tref_K)))*0.85...
      +((Aw*T(12)+0.5*Bw*T(12)^2+(1/3)*Cw*T(12)^3)-...
      (Aw*Tref_K+0.5*Bw*Tref_K^2+(1/3)*Cw*Tref_K^3))*0.85; %CO2(g)+H2O(l)

h_2={'stream' 'T', 'p', 'h', 'total mass','CO2 gas',...
     'H2O gas','N2 gas','O2 gas','MEA', 'CO2'};

label_2={'-' 'K' 'bar' 'kJ/kg' 'kg/s' ...
        'wf' 'wf' 'wf' 'wf' 'wf' 'wf'};

stream_2=[...
1,T(1)+c,p(1),h1,m1,wc1,wh1,wn1,wo1,0,0;...
2,T(2)+c,p(2),h2, x(1),x(9),x(10),x(11),x(12),0,0;...
3,T(3)+c,p(3),h3,x(2),0,0,0,0,wMEA3,wc3;...
4,T(4)+c,p(4),h4,x(4),0,0,0,0,wMEA4,wc4;...
5,T(5)+c,p(5),h5,x(4),0,0,0,0,wMEA4,wc4;...
6,T(6)+c,p(6),h6,x(6),0,0,0,0,wMEA3,wc3;...
7,T(7)+c,p(7),h7,x(6),0,0,0,0,wMEA3,wc3;...
8,T(8)+c,p(8),h8,x(7),0.85,0.15,0,0,0,0;...
9,T(9)+c,p(9),h9,x(8),1,0,0,0,0,0];

Tabell_2=[h_2;label_2;num2cell(stream_2)]



% ville brukt denne til residual2 funksjonen for 
% ? finne T7
%x0 = 70 ;
%x = fsolve(@residual2, x0); 




% totalt energiforbruk kj?ler V-3
% negativ:varme inn, positiv:varme ut

dHkond=-(dHsub-dHfus);

QV3 = m8*wc8*(T(12)-T(8))*cpg(1)... 
    + m8*wh8*(T(12)-T(8))*cpg(2)...
    + m8*wh8*(dHkond/Mw(2))*10^3; % kJ/s

%totalt energiforbruk koker V-4

QV4=-h5-QV3+h9+h6; % kJ/s

%totalt energiforbruk stripper

Qstripper=abs(QV4); %kJ/s;


