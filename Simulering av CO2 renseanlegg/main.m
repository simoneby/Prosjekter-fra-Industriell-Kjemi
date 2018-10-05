%% Header main file
%  Author: SB og ACGW
%  Date  : 20.05.2016
%  Purpose: simulate heat exchanger

t0 = [ 40,60 ];
T = fsolve(@residual3, t0);

disp(T(1))
disp(T(2))




