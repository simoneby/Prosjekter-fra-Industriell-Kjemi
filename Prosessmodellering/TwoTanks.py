# Simone Bystadhagen
# 3.oktober.2017
# NTNU
# Simulates two tanks steadily filling up with overflow.

import matplotlib.pyplot as plt

x0 = [0,0] # Initial condition. 0 = empty tank, 1 = full tank. Cannot be higher than 1
f = 0.01 # 0.1 per second
t = 0
h = 0.1
xk0 = list()
xk1 = list()
time = list()
stop = 300 #stop after 10 seconds


for i in range(stop):
    if i == 0:
        tmpxk0 = x0[0]
        tmpxk1 = x0[1]
    time.append(t)
    t += h
    xk0.append(tmpxk0)
    xk1.append(tmpxk1)
    if tmpxk0 < 1-0.001:
        tmpxk0 += f
    else:
        tmpxk0 = 1
    if tmpxk0 == 1 and tmpxk1 < 1-0.001: #correction factor to make plot look pretty heh
        tmpxk1 += f
    elif tmpxk0 == 1 and tmpxk1 > 1-0.001:
        tmpxk1 = 1


plt.plot(time,xk0)
plt.plot(time,xk1)
plt.show()