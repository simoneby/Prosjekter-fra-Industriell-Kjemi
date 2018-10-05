function Cp = getCpH2O(T) %T i Celsius
%FInner varmekapasitet til vann gitt temperatur. 
T = T + 273.15;
% heat capacity constants (water)
% --------------------------------
Aw =        5.0536;  % kJ/(kg K)
Bw = -5.6552*10^-3;  % kJ/(kg K^2)
Cw =  9.1400*10^-6;  % kJ/(kg K^3)

A = Aw ;
B = Bw ;
C = Cw ; 

   
Cp = A + B*T + C *T^2;
end
