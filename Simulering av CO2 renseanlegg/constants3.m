% ----------------------------------------------------------------------
% purpose: CONSTANTS for CO2 CAPTURE PROJECT 2015
% author:  camilla.berge.vik@ntnu.no
% date:    03.05.2013
% revised: 07.03.2014, 09.01.2015, 23.01.2015
% set 3
% ----------------------------------------------------------------------

% operation parameters
% ----------------------------------------------------------------------
alpha3   = 0.16;   % (mol CO2abs)/(mol amine (MEA))  CO2 loading into absorber
alpha4   = 0.45;  % (mol CO2abs)/(mol amine (MEA))  CO2 loading out of absorber
wcapture = 0.8;   % kg(CO2,captured)/kg(CO2,feed) CO2 capture rate
eta      = 0.85;  % -            efficiency factor (all compressors)
waMEA    = 0.30;  % -            weight fraction monoethanolamine (MEA), MEA-sol
U        = 1150;  % W/(m^2*K)    heat transfer coefficient
xc8      = 0.7;   % -            mole fraction of CO2 in stream 8
wc9      = 1;     % -            wt fraction CO2 stream 9

% inlet conditions
% -----------------------------------------------------------------------
m1    = 500;    % kg/s       mass flow (total), stream 1
wc1   = 0.09;  % -          mass fraction CO2, stream 1
wh1   = 0.03; % -          mass fraction H2O, stream 1
wn1   = 0.79;  % -          mass fraction N2,  stream 1
wo1   = 0.09; % -          mass fraction O2,  stream 1

% temperature
% -----------------------------------------------------------------------
T = zeros(12,1);
T(1)  = 40;     % degC       stream 1
T(2)  = 40;     % degC       stream 2
T(3)  = 40;     % degC       stream 3
T(4)  = 55;     % degC       stream 4
T(5)  = 106;    % degC       stream 5
T(6)  = 120;    % degC       stream 6
% T(7) to be calculated
T(8)  = T(5);   % degC       stream 8
T(9)  = 25;     % degC       stream 9
T(10) = 5;      % degC       stream 10
T(11) = 25;     % degC       stream 11


% pressure
% ----------------------------------------------------------------------
p = zeros(9,1);
p(1) = 1;       % bar        stream 1
p(2) = 1;       % bar        stream 2
p(3) = 1;       % bar        stream 3
p(4) = 1;       % bar        stream 4
p(5) = 2;       % bar        stream 5
p(6) = 2;       % bar        stream 6
p(7) = 2;       % bar        stream 7
p(8) = p(5);    % bar        stream 8
p(9) = 2;       % bar        stream 9

% molar masses
% ----------------------------------------------------------------------
Mw = zeros(4,1);
Mw(1) = 44.01;      % g/mole     CO2
Mw(2) = 18.015;     % g/mole     H2O
Mw(3) = 28.015;     % g/mole     N2
Mw(4) = 31.998;     % g/mole     O2
MwMEA = 61.08;      % g/mole     MEA

% enthalpies 
% ---------------------------------------------------------------------
hf(1) =    -8933; % kJ/kg      std enth. of formation of CO2
hf(2) = -13423.3; % kJ/kg      std enth. of formation of H2O
hf(3) = 	   0; % kJ/kg      std enth. of formation of N2
hf(4) =        0; % kJ/kg      std enth. of formation of O2
hfsol =   -13599; % kJ/kg      std enth. of formation of 30 wt% MEA-sol
habs_m =      80; % kJ/mol(abs.CO2) delta h absorption per mol absorbed co2

% heat capacity (pure gases)
% ---------------------------------------------------------------------
cpg(1) = 0.868;    % kJ/(kgK)   heat capacity at 40 deg C for CO2
cpg(2) = 1.866;    % kJ/(kgK)   heat capacity at 40 deg C for H2O
cpg(3) = 1.040;    % kJ/(kgK)   heat capacity at 40 deg C for N2
cpg(4) = 0.919;    % kJ/(kgK)   heat capacity at 40 deg C for O2

% heat capacity constants (water)
% ---------------------------------------------------------------------
Aw =        5.0536;  % kJ/(kg K)
Bw = -5.6552*10^-3;  % kJ/(kg K^2)
Cw =  9.1400*10^-6;  % kJ/(kg K^3)

% heat capacity constants (pure monoethanolamine)
% ---------------------------------------------------------------------
Aa =      -0.64878; % kJ/(kg K)
Ba =  1.6992*10^-2; % kJ/(kg K^2)
Ca =       -1.9e-5; % kJ/(kg K^3)

% heat capacity constants (monoethanolamine + water solution)
% ---------------------------------------------------------------------
As = -4.9324;    % kJ/(kg K)
Bs = 0.01469;    % kJ/(kg K^2)
Cs = 69.6243;    % kJ/(kg K^(-0.5859)) 

% heat capacity constants (co2 in monoethanolamine + water solution)
% ---------------------------------------------------------------------
Ac = 0.585;      % kJ/(kg K)
Bc = 0.0009;     % kJ/(kg K^2)
% henry's constant as a function of temperature
% ---------------------------------------------------------------------
Hc(1) = 4.96563e2; % kPa m^3 mol^-1      c1
Hc(2) = 3.41697e5; % kPa m^3 mol^-1 K    c2
Hc(3) = 1.69131e0; % -                   c3
Hc(4) = 1.47225e3; % K                   c4
Hc(5) = 1.28338e5; % K^2                 c5

% enthalpy of vaporisation (condensation) for water at 298 K
% ---------------------------------------------------------------------
dHfus = 6.0;       % kJ mol^-1 
dHsub = 50;        % kJ mol^-1

% misc. constants
% ----------------------------------------------------------------------
Tref_K   = 298;   % K            reference temperature, K
Tref_C   =  25;   % C            reference temperature, C
gasConst = 8.314; % J/(K mol)    universal gas constant