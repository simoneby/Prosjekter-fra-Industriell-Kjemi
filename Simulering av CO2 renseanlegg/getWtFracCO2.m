% purpose: Finne vektfraksjonen til CO2 i str?m 3 og 4 gitt loading a
% authors: SB
% date: 18.april.2016

function wCO2 = getWtFracCO2 (a)
MmMEA = 61.08; %g/mol
MmCO2 = 44.01; %g/mol
wCO2 = (MmCO2*a)/(((1+(0.7/0.3))*MmMEA));
end