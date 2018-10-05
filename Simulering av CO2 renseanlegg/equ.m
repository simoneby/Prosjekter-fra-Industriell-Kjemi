function ksi = equ(m)

%Adjust tolerance for fsolve
options.TolFun      = 1e-15;

x0=m;
ksi = fsolve(@res2, x0, options) ;



end