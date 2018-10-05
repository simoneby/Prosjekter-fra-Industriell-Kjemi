% author: Simone Bystadhagen
% purpose: Calculate the partial molar enthalpy of a given amout of salt. 
% comment: Calculation is done with statistical uncertaincies


function res = molar_enthalpy_of_accumulated_salt()
%% akkumulert masse og mol :D 
Mm = 101.1032; %stoffmengde salt
measure = [ 4.06, 4.00, 8.05, 8.01, 7.99, 8.00, 7.98, 7.99, 8.00] ; %masse tilsatt salt 
Cp_vann = 75 ;% J / ( K * mol )
q = (11.96^2 * 45 )/4.7; % J 
molar_vann = 18.01;  %stoffmengde vann
vann_mol = 1000 / molar_vann ;% mol %stoffmengde vann 
U = 11.96; %volt
t = 45; %sekunder
R = 4.70; % Ohm
Sn = 0.0002; %usikekrhet mol
kelvin = 273; %forklarer seg selv

akk_mass = zeros(1,9);
akk_mass = zeros(1,9);
akk_mass(1) = measure(1);

for i = 2:9
    akk_mass(i) = akk_mass(i-1) + measure(i); 
    akk_mol(i-1) = akk_mass(i-1)/(Mm) ; %akumulert stoffmengde 
end
akk_mol(9)=akk_mass(9)/Mm; 


%% Delta T

dT_s = [ -0.323, -0.317, -0.616, -0.610, -0.598, -0.592, -0.579, -0.530, -0.547]; % 9 verdier %Endring i Temp etter tilsats av salt
dT_r = [ 0.310, 0.311, 0.309, 0.311, 0.312, 0.312, 0.308, 0.307 ]; % 8 verdier % endring i temp etter tilsats av str?m

%% Delta H
dH = zeros(1,9);
C = zeros(1,7);

for i = 1:2
    dH(i) = -Cp_vann * vann_mol * dT_s(i); %Beregning av 2 f?rste verdier av dH med Cp til vann
end

for i = 1:7
    C(i) = q/(dT_r(i+1)); % Beregning av Cp til beregning av resterende 7 verdier av dH
end

for i =  3:9 
    dH(i) = -C(i-2) * dT_s(i); %Beregning av de 7 resterende verdier av dH
end

%% Blandingsentalpi regnes ved ? akkumulere Delta H
dH_mix = zeros(1,9);

dH_mix(1)=dH(1); 

for i = 2:9
    dH_mix(i) = dH(i) + dH_mix(i-1) ;
end

%% Finner polynomkoeffesientene til polyregresjonen av plott blandingsentalpi mot akkumulert mol
p = polyfit(akk_mol,dH_mix,2); % Finner polynomkoeffisientene
f = polyval(p,akk_mol);   % Lager datapunkter for regresjonslinjen


%% Partiell molar entalpi for salt
partial_mol_H2 = (2*p(1) * akk_mol) + p(2) ; %Ganger med den deriverte av p for ? finne partiell molar entalpi

%% Regner likning partiell molar entalpi for vann
partial_mol_H1 = zeros(1,9); %hjelpevektor

for i = 1:9
    partial_mol_H1(i) = (akk_mol(i)/vann_mol) * ((dH_mix(i)/akk_mol(i))-partial_mol_H2(i)) ;
end

%% Temperaturer
T_start = 20.600 + kelvin; %starttemperatur
T_salt = [20.277, 19.960, 19.654, 19.355, 19.066, 18.785, 18.518, 18.300, 18.093] + kelvin; %temperatur etter tilsats av salt
T_strm = [0, 20.270, 19.965, 19.664, 19.377, 19.097, 18.830, 18.640, 18.400] + kelvin; %temperatur etter str?m
%% Usikkerheter doble standardavvik (konstanter)
Sv = 0.8 ; % g eller ml.  usikkerhet i vann.
S_T= 0.002 ; % K usikkerhet temperatur
Sm = 0.02 ; % usikkerhet i antall gram
Sn = 0.0002  ; %usikkerhet i antall mol
S_R = 0.01 ; %usikkerhet i motstand
S_U = 0.01 ; %usikekrhet i volt
S_t = 0.01; %usikkerhet i tid 

%% Usikkerhet i endringen til temperatur (S_dT)

S_dT = sqrt(2)*S_T;

%% Usikkerhet i varme (Sq)

Sq = sqrt ( (((2*U*t)/R)^2 * S_U^2) + (U^2/R)^2 * S_t^2 + ((U^2*t)/R^2)^2*S_R^2 );

%% Usikkerhet i varmekapasitet (S_Cp)
S_Cp = zeros(1,9);

for i = 3:9
    S_Cp(i) = sqrt((1/(dT_r(i-1)))^2*Sq^2 + ((q / dT_r(i-1)^2)^2) * S_dT^2);
end

%% usikkerhet i delta H_mix (S_dH_mix) (akkumulert under rottegn, gjort p? litt spesiell m?te)
S_dH_mix = zeros(1,9);

index = 0;
index = dT_s(1)^2 * S_Cp(1)^2 + (Cp_vann * vann_mol)^2 *  S_dT^2 ; %((20.600)^2 + 20.277^2 )*
S_dH_mix(1) = sqrt(index) ;

index = index + dT_s(2)^2 * S_Cp(2)^2 + (Cp_vann * vann_mol)^2 * S_dT^2 ; % (19.960^2 + 20.277^2 )*
S_dH_mix(2) = sqrt(index) ;


for i = 3:9
    
    S_dH_mix(i) = dT_s(i)^2 * S_Cp(i)^2 + C(i-2)^2* S_dT^2 ; %(T_strm(i-1)^2 + T_salt(i)^2) *
    
    index = index + S_dH_mix(i);
    
    S_dH_mix(i) = sqrt(index);  
end

%% Usikkerhet akkumulert mol (Sn_akk)
Sn_akk = zeros(1,9) ;

for k = 1:9
    Sn_akk(k) = sqrt(k)*Sn ;
end

%% Usikkerhet i antall mol vann (S_n1)

S_n1 = Sv / molar_vann;

%% Usikkerhet i molar entalpi til salt (S_dH_2)
S_dH_2 = zeros(1,9);
S_p = [ 42.34, 308.34, 452.94]; 

for i = 1:9
    S_dH_2(i) = sqrt( (2*Sn_akk(i))^2 * S_p(1)^2 + S_p(2)^2 + (2*(p(1)))^2 * Sn_akk(i)^2 ) ;
end
    
%% Usikkerhet i molar entalpi til vann (S_dH_1)
S_dH_1 = zeros(1,9);
    
for i = 1:9
    a = (akk_mol(i) * (dH_mix(i)/akk_mol(i) - partial_mol_H2(i))) /( vann_mol^2 ) ;
    b = (partial_mol_H2(i)/vann_mol) ;
    c = (1/vann_mol);
    d = (akk_mol(i)/vann_mol);
    S_dH_1(i) = sqrt ( a^2*S_n1^2 + b^2 * Sn_akk(i)^2 + c^2 * S_dH_mix(i)^2 + d^2 * S_dH_2(i)^2 ) ;
end
        
        
        
%% plot delta H mix mot akk_mol
figure
p = polyfit(akk_mol,dH_mix,2); % Finner polynomkoeffisientene
f = polyval(p,akk_mol);   % Lager datapunkter for regresjonslinjen
hold on
%errorbar(akk_mol,dH_mix,S_dH_mix,S_dH_mix,'.k'); % x,y,yerr,yerr
%herrorbar(akk_mol,dH_mix,Sn_akk,Sn_akk,'.')
plot(akk_mol, dH_mix,'x')
xlabel('Akkumulert molmengde [mol]','FontSize',18)
ylabel('Blandingsentalpi [J]','FontSize',18)

%% plot delta H1 mot akk_mol
figure
hold on
errorbar(akk_mol,partial_mol_H1,S_dH_1,S_dH_1,'.k'); % x,y,yerr,yerr
herrorbar(akk_mol,partial_mol_H1,Sn_akk,Sn_akk,'.')
plot(akk_mol, partial_mol_H1,'x')
xlabel('Akkumulert molmengde [mol]','FontSize',18)
ylabel('Partiell molar entalpi for vann [J/mol]','FontSize',18)

%% plot delta H2 mot akk_mol
figure
hold on
errorbar(akk_mol,partial_mol_H2,S_dH_2,S_dH_2,'.k'); % x,y,yerr,yerr
herrorbar(akk_mol,partial_mol_H2,Sn_akk,Sn_akk,'.')
plot(akk_mol, partial_mol_H2,'x')
xlabel('Akkumulert molmengde [mol]','FontSize',18)
ylabel('Partiell molar entalpi for salt [J/mol]','FontSize',18)


%% Display
%Sq = Sq
%S_Cp = S_Cp
%dH_mix = dH_mix 
%S_dH_mix = S_dH_mix
%Sn_akk = Sn_akk
%S_n1 = S_n1
%partial_mol_H2 = partial_mol_H2
%S_dH_2 = S_dH_2
%partial_mol_H1 = partial_mol_H1
%S_dH_1 = S_dH_1
C=C



end