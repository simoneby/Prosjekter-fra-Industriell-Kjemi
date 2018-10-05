function L = res(x)
run('const.m');
Th_ut=x(1);
Tc_ut=x(2);


L(1) = (mh*Cph*(Th_inn-Th_ut))-(mc*Cpc*(Tc_ut-Tc_inn));
L(2) = (mh*Cph*(Th_inn-Th_ut)) - ( U * A * ( (Th_ut-Tc_inn) - ( Th_inn-Tc_ut) )/ (log ( (Th_ut-Tc_inn) / (Th_inn-Tc_ut) ) ) );
L(3) = (mc*Cpc*(Tc_ut-Tc_inn)) - ( U * A * ( (Th_ut-Tc_inn) - ( Th_inn-Tc_ut) )/ (log ( (Th_ut-Tc_inn) / (Th_inn-Tc_ut) ) ) );
end