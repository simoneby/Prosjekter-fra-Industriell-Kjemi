%% Header residual file
%  Author: SB og ACGW
%  Date  : 20.05.2016
%  Purpose: residual file
function res = residual3(T)

run('constants4.m') ;

Tcu = T(1);
Thu = T(2);

res(1) = (U*A*((Thi-Tcu)-(Thu-Tci))/(log((Thi-Tcu)/(Thu-Tci))))-mc*cpC*(Tcu-Tci)
res(2) = (U*A*((Thi-Tcu)-(Thu-Tci))/(log((Thi-Tcu)/(Thu-Tci))))-mh*cpH*(Thi-Thu)
res(3) = mh*cpH*(Thi-Thu)-mc*cpC*(Tcu-Tci)



end