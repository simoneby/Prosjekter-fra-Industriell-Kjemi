# Who: Simone Bystadhagen
# When: 18.september 2017
# What: Make General Runge Kutta
# Where: NTNU gløshaugen 
# Why: Solve øving 3 Prosmod

import matplotlib.pyplot as plt
import math

def RungeKutta(dxdt, xk, tk, h, N ):
    tK1 = [0]*N
    xK1 = [0]*N
    x_kp1 = [0] * len(xk)
    for j in range(0, N):
        K1 = [0]*len(xk)
        temp = dxdt(xk,tk)
        tempx = [0]*len(xk)
        for i in range(len(xk)):
            K1[i] = h*temp[i]
            tempx[i] = xk[i]+0.5*K1[i]
        K2 = [0]*len(xk)
        temp = dxdt(tempx, tk +0.5*h)
        for i in range(len(xk)):
            K2[i] = h*temp[i]
            tempx[i] = xk[i]+0.5*K2[i]
        K3 = [0]*len(xk)
        temp = dxdt(tempx, tk + 0.5*h)
        for i in range(len(xk)):
            K3[i] = h*temp[i]
            tempx[i] = xk[i]+K3[i]
        K4 = [0]*len(xk)
        temp = dxdt(tempx, tk +h)
        for i in range(len(xk)):
            K4[i] = h*temp[i]
        for i in range(len(xk)):
            x_kp1[i] = xk[i]+(1/6)*(K1[i]+2*K2[i]+2*K3[i]+K4[i])
        t_kp1 = tk + h
        tK1[j] = t_kp1
        xK1[j] = x_kp1
        xk = x_kp1
        tk = t_kp1
        x_kp1 = [0] * len(xk)
    return(tK1, xK1)


def dxdt(x0,t):
    return [-x0[1], x0[0]]
[tk1, xK1]= RungeKutta(dxdt, [1,0],0, 0.01, int(2*math.pi/0.01))



x1 = [item[0] for item in xK1]
x2 = [item[1] for item in xK1]

plt.plot(x1,x2)
plt.show()