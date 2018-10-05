function [Th_ut,Tc_ut] = getHeat()
x0=[70,35] % Th_ut, Tc_ut gjetter temperaturene ut

x = fsolve(@res,x0)



end