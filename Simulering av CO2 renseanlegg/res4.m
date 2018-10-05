function L = res4(T)
R = 8.314; % constant
K = 38.7;
delH_298 = -198 *10^3; 
delS_298 = -187;
rCp = -7;

L = (-delH_298+rCp*(T-298))/(R*T)+(delS_298+rCp*log(T/298))/(R)-log(K)
end
