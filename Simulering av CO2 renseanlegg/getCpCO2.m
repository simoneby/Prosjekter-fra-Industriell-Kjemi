function Cp = getCpCO2(T) %T i Celsius
T = T %+ 273.15;

% heat capacity constants (co2 in monoethanolamine + water solution)
% ---------------------------------------------------------------------
Ac = 0.585;      % kJ/(kg K)
Bc = 0.0009;     % kJ/(kg K^2)
Cc = 0;          % kJ/(kg K^3)

A = Ac ;
B = Bc ;
C = Cc ; 

   
Cp = A + B*T + C *T^2;
end
