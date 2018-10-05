function F = residual_stream(f)

global Re eps_delt_paa_d x0

F = 4*log(eps_delt_paa_d/3.71+ 1.255/(Re*sqrt(f(1)))) + 1/sqrt(f(1))


end
