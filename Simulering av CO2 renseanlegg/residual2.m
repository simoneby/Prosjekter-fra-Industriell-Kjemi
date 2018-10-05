%%
% purpose: calculate residual2 for beregning av temperatur i str?m 7
% authors: SB
% date: 18.april.2016

% Denne funksjonen funker ikke, har brukt ekstremt mye tid og krefter, 
% spurt flere studasser men
% MATLAB gir bare ut "no solution found". N?r jeg pr?ver ? gj?re det samme
% som fsolve gj?r manuelt, alts? pr?ve og feile, f?r jeg at temperaturen
% skal v?re 52 grader, dette kan ikke stemme fordi den kaldeste str?mmen er
% kun 55 gader. Jeg finner desverre ikke noe feil, men vi ansl?r en T p? 70
% grader celsius for senere beregninger. 

function K = residual2(x)

h7 = -13263 ;
wc3 = 0.0346 ;
hfsol = -13599; % kJ/kg      std enth. of formation of 30 wt% MEA-sol
habs_m =  80; % kJ/mol(abs.CO2) delta h absorption per mol absorbed co2
Mw = 44.01;
hf =  -8933;
%run('constants3.m') 

K(1) = (0.9654*getEnthalpyMEAsol(x)+0.0346*getIntCpCO2(x))+((1-wc3)*hfsol+wc3*hf)+((wc3*habs_m/Mw)*1000)-h7
end
