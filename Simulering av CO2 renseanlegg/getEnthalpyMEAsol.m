% purpose: Finne og integrere vamekapasitet til MEA og vann l?sning
% authors: SB
% date: 18.april.2016

function enthalpyMEA = getEnthalpyMEAsol(T) %T i Celsius
T = T + 273.15; %Gj?r om til Kelvin

% heat capacity constants (water)
% ----------------------------------
Aw =        5.0536;  % kJ/(kg K)
Bw = -5.6552*10^-3;  % kJ/(kg K^2)
Cw =  9.1400*10^-6;  % kJ/(kg K^3)

% heat capacity constants (pure monoethanolamine)
% ------------------------------------------------
Aa =      -0.64878; % kJ/(kg K)
Ba =  1.6992*10^-2; % kJ/(kg K^2)
Ca =       -1.9e-5; % kJ/(kg K^3)

% heat capacity constants (monoethanolamine + water solution)
% ------------------------------------------------------------
As = -4.9324;    % kJ/(kg K)
Bs = 0.01469;    % kJ/(kg K^2)
Cs = 69.6243;    % kJ/(kg K^(-0.5859)) 


Tref=298.15;

A = [Aw,Aa] ;
B = [Bw,Ba] ;
C = [Cw, Ca] ;

k=1;

tempvector = [Tref:1:T];

Cp = zeros(k,length(tempvector));    

%Lager en matrise med varmekapasiteter

while k <= 2;  
    for i = 1:length(tempvector)
        Cp(k,i)=A(k)+B(k)*tempvector(i)+C(k)*tempvector(i)^2;
    end
    k=k+1;
end
 
%Regner ut varmekapasiteter for l?sningen
Cpsol = 0.7*Cp(1,:)+0.3*Cp(2,:)+0.3*0.7*(As+Bs*tempvector...
       +Cs*0.3*(T-Tref)^(-1.5859)) ; %Likning gitt i A.5 (10)

% Integrasjon med trapesmetoden
value=0;
for i = 1:length(tempvector)-1 
    value = value + (tempvector(i+1)-tempvector(i))*((Cpsol(i)+Cpsol(i+1))/2);
end

enthalpyMEA = value;
end

        
        
        
        
        
        
        
        

