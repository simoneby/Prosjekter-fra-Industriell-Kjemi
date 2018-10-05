% purpose: Integrere vamekapasitet til CO2 i MEA+vann l?sning
% authors: SB
% date: 18.april.2016

function enthalpyCO2 = getIntCpCO2(T) %T i Celsius
T = T + 273.15;
%Beregne Cp til l?sningen??

% heat capacity constants (co2 in monoethanolamine + water solution)
% ---------------------------------------------------------------------
Ac = 0.585;      % kJ/(kg K)
Bc = 0.0009;     % kJ/(kg K^2)
Cc = 0;

Tref=298.15;

A = Ac ;
B = Bc ;
C = Cc ; 

tempvector = [Tref:1:T];  
Cp = zeros(1,length(tempvector));    

%Lager en vektor med varmekapasiteter for forskjellige T
for i = 1:length(tempvector)
     Cp(i)= A + B*tempvector(i) + C*tempvector(i)^2;
end

%Bruker trapesmetoden for ? integrere
value=0;
for i = 1:length(tempvector)-1
    value = value + ((tempvector(i+1)-tempvector(i))*((Cp(i)+Cp(i+1)/2)));
end

enthalpyCO2 = value;
end
