% purpose: Finne ideell og reell Ws og T
% authors: ACW
% date: 18.april.2016

run('constants3.m')

Cpm=cpg(1)*Mw(1); %Molar varmekapasitet for CO2 J / Kmp?
RCp=gasConst/Cpm; % R/Cpm

Pb=9;    % bar 
Pc=4;    % bar 
Pd=8;    % bar 
Pe=8;    % bar 
Pf=20;   % bar 
Tc=303;  % K
Te=303;  % K 
Tut=303; % K


%----idelle tempraturer-------------
Tb = (T(9)+273)*((Pb/p(9))^(RCp)); %K temp i str?m 9,b
Td = Tc*((Pd/Pc)^(RCp));           %K temp i str?m 9,d
Tf = Te*((Pf/Pe)^(RCp));           %K temp i str?m 9,f

%---  arbeid fra kompressorer--------
WSrev(1) = 36*cpg(1)*(Tb-(T(9)+273));  % KJ steg 1 reelt
WSrev(2) = 36*cpg(1)*(Td-Tc);          % KJ steg 2 reelt
WSrev(3) = 36*cpg(1)*(Tf-Te);          % KJ steg 3 reelt

Wsrev = WSrev(1)+WSrev(2)+WSrev(3); %KJ Ideelt total arbeid
Ws1=WSrev(1)/eta;
Ws2=WSrev(2)/eta;
Ws3=WSrev(3)/eta;
Ws= (Ws1+Ws2+Ws3); % KJ Totalt reelt arbeid fra kompressor



%---reelle temperaturer---------
TbR = Ws1/(36*cpg(1))+(T(9)+273);
TdR = Ws2/(36*cpg(1))+Tc;
TfR = Ws3/(36*cpg(1))+Te;

%-----varme fra varmeveksler---------------------
Q1 = 36*cpg(1)*(Tc-TbR);   %KJ kj?ler steg 1
Q2 = 36*cpg(1)*(Te-TdR);   %KJ kj?ler steg 2
Q3 = 36*cpg(1)*(Tut-TfR);  %KJ kj?ler steg 3

Q = Q1 + Q2 + Q3;


disp ( ' for tre-stegskompresjon: ' )

tabell=[Tb,TbR,WSrev(1),Ws1,Q1;Td,TdR,WSrev(2),Ws2,Q2;Tf,TfR,WSrev(3),Ws3,Q3];
h = {'idell T', 'reell T' , 'Ws_rev fra kompressor','Ws fra kompressor' 'Q fra varmeveksler'};

tre_steg_kompresjon=[h;num2cell(tabell)] 



Totalt_ideelt_arbeid = WSrev(1)+WSrev(2)+WSrev(3) %KJ Ideelt total arbeid
Totalt_reelt_arbeid = Ws % KJ Totalt reelt arbeid fra kompressor

Total_Q_fra_kjoler = Q1 + Q2 + Q3 %KJ total varme fra kj?ler 

Entalpi_endring_tre_steg_kompresjon = Ws + Q




%---ETT-STEGSKOMPRESJON----
disp ( ' for ett-stegskompresjon: ' )
TI = (T(9)+273)*((Pf/p(9))^(RCp));
Idell_T = (T(9)+273)*((Pf/p(9))^(RCp))   % K temp i str?m 9,b
WSrev1 = 36*cpg(1)*(TI-(T(9)+273));  % KJ ideelt arbeid
Ideelt_arbeid = WSrev1
Ws1 = WSrev1/eta;% KJ reelt arbeid
Reelt_arbeid = Ws1
TR = Ws1/(36*cpg(1))+(T(9)+273); % K reelle temp
Reell_T = TR
Q_1 = 36*cpg(1)*(Tut-TR);% KJ varme fra kj?ler 
varme_fra_kjoler = Q_1
Ending_entalpi_ett_steg_kompresjon = Ws1+Q_1 % KJ Endring i entalpi