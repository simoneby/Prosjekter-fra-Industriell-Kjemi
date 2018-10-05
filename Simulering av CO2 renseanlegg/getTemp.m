%% Header
%  25.05.2016
%  Calculate temperature given an equlibrium constant and a reaction

function temp = getTemp()
clc
options.TolFun=1e-100;
x0=373; 
temp = fsolve(@res4,x0,options);
end
