# Who: Simone Bystadhagen
# When: 13.september 2017
# What: Make general euler
# Where: NTNU gløshaugen F1
# Why: Solve øving 3 Prosmod
# Tidligere versjon: https://paste.ee/p/ftt1l
import math
import matplotlib.pyplot as plt

xk = [1,0] # input
h = 0.01 # input
e = 2*math.pi # input

def dxdt(xk, t): # Made for integrating over a circle
    return [-xk[1], xk[0]]

"""
the function with the derivative needs to be evaluated for each and every problem, but the euler function is general
"""

def euler(e, h, xk, dxdt): # e: end, h:step length, xk: inital values, dxdt: derivative of function
    n = int(e/h) # number of iterations
    s = len(xk) #length of vector with inital values
    xpk = list()
    pair = list()
    for t in range(0,n):
        dx = dxdt(xk,t)
        for i in range(s):
            xpk.append(xk[i] + h*dx[i])
            pair.append(xpk[i])
        xk = xpk
        xpk = list()
    pair = [pair[x:x + s] for x in range(0, len(pair), s)]
    return pair

pair = euler(e,h,xk,dxdt)


Lx = [item[0] for item in pair] #Ikke generelt, men funker kun for euler med 2 variabler
Ly = [item[1] for item in pair]

Lx.pop(0)
Ly.pop(0)

plt.plot(Lx,Ly,'.')
plt.show()













