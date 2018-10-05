% purpose: Teste at partialtrykk ?ker n?r temperaturen ?ker
% authors: AH
% date: 18.april.2016


function res = trykkT
    a=0.3;
    c1=4.96563*10^2;
    c2=3.41697*10^5;
    c3=1.69131;
    c4=1.47225*10^3;
    c5=1.28338*10^5;
    KH=zeros(1,8);
    K=zeros(1,8);
    A = [273,298,313,333,353,373,393,423]
    PCO2=zeros(1,8);
    for i = 1:8
        T=A(i);
    
    switch T
        case 273
            K2=3.93*10^5;
        case 298
            K2=3.70*10^4;
        case 313
            K2=1.14*10^4;
        case 333
            K2=2.43*10^3;
        case 353
            K2=5.78*10^2;
        case 373
            K2=2.46*10^2;
        case 393
            K2=4.08*10;
        case 423
            K2=6.74;
    end
    KH(i)=(c1+c2*a*T^(-1))*exp(c3*a^2+c4*T^(-1)+c5*a*T^(-2));
    K(i)=KH(i)/K2
    PCO2(i)=(KH(i)*0.5^2)/(K2*(1-2*a)^2)
    end
    plot(PCO2,A)
end