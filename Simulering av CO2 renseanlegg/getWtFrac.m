% purpose: Finne vektfraksjon gitt molfraksjon
% authors: SB
% date: 18.april.2016


function wf = getWtFrac(molefraction, component1, component2)
% Fungerer kun for en str?m med to komponenter der molfraksjonen til 
% komponent 1 er kjent. 
n = molefraction; 
Mw = zeros(4,1);
Mw(1) = 44.01;      % g/mole     CO2
Mw(2) = 18.015;     % g/mole     H2O
Mw(3) = 28.015;     % g/mole     N2
Mw(4) = 31.998;     % g/mole     O2
MwMEA = 61.08;      % g/mole     MEA


if component1 == 'CO2'
    mw1=Mw(1);
elseif component1 == 'H2O'
    mw1=Mw(2);
elseif component1 == 'N2'
    mw1=Mw(3);
elseif component1 == 'O2'
    mw1=Mw(4);
elseif component1 == 'MEA'
    mw1=MwMEA;
else
    error('not a valid component 1')
end

if component2 == 'CO2'
    mw2=Mw(1);
elseif component2 == 'H2O'
    mw2=Mw(2);
elseif component2 == 'N2'
    mw2=Mw(3);
elseif component2 == 'O2'
    mw2=Mw(4);
elseif component2 == 'MEA'
    mw2=MwMEA+Mw(2);
else
    error('not a valid component 2')
end

top = n*mw1;
bottom = (1-n)*mw2;

wf=top/bottom;
end