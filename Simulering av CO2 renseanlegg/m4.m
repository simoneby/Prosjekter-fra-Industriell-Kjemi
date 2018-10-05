%% header
% ACGW & SB
% 20.05.2016
clc

% kjente variable
X = 0.80 % omsetningsgrad over reaktor
n1 = 100 % mol/s 100% propan
s = [0.01 0.9 0.09]' % splittfaktor propan propen H2

% massebalanser

n2 = [n1*(1-X),  n1*X , n1*X ]' 
n3 = n2 .* s  
n4 = n2 - n3 


% skriv p? formen Ax = b
%  x = [n2 n3 n4]'
%A = [1, 0 , 0; 0, 1, 0; -1, -1, 1]
%b = [ n1*(1-X) +  n1*X + n1*X, sum(n2*s), 0]'

%x = A\b