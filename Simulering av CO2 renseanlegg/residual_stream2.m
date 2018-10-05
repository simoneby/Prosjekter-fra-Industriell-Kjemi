function F = residual_stream2(x)

D_A = 0.1; %m
D_B = 0.08; %m
D_C = 0.12; %m
AL = 10000; %m
BL = 20000; %m
CL = 30000; %m
f = 0.005; %m
PA = 3; %bara absolute pressure
PB = 1.8; %bara absolute pressure
R = 8.314; % J/mol
Mmetan = 16; %g/mol
A_A = ((D_A^2)/4) * pi * AL;
A_B = ((D_B^2)/4) * pi * BL;
A_C = ((D_C^2)/4) * pi * CL;
T = 298; % K

m_a = x(1) ;
m_b = x(2) ;
m_c = x(3) ;
PD = x(4) ;
PC = x(5) ;

F(1) = m_b + m_c - m_a;
F(2) = m_c - m_b;
F(3) = (m_a/A_A)^2 * R * T * (((f*AL)/D_A)+2*log(PA/PD))-PA^2+PD^2 ;
F(3) = (m_b/A_B)^2 * R * T * (((f*BL)/D_B)+2*log(PD/PB))-PD^2+PB^2 ;
F(3) = (m_c/A_C)^2 * R * T * (((f*CL)/D_C)+2*log(PD/PC))-PD^2+PC^2 ;


end
