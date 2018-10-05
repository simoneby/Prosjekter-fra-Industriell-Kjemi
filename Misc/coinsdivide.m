% author: Simone Bystadhagen
% purpose: It divides a price into coins. 
% comment: Greedy algorithm before i knew what a greedy algorithm
%          was.

function result = coinsdivide(price)
if price ~= round(price)
    error('tast inn et heltall')
end    
if price/20 == round(price/20)
    twenty = price/20;
else
    twenty=(price-rem(price,20))/20;
end
price=price-(twenty*20);
if price/10 == round(price/10);
    ten = price/10
else
    ten=(price-rem(price,10))/10;
end
price=price-(ten*10); %I defined price all over again so i could save time with copy/paste most of my code
if price/5 == round(price/5);
    five = price/5;
else
    five=(price-rem(price,5))/5;
end
price=price-(five*5);
if price/1 == round(price/1)
    one = price/1;
else
    one=(price-rem(price,1))/1;
end
fprintf('Antall 20-kroninger: %d\n',twenty)
fprintf('Antall 10-kroninger: %d\n',ten)
fprintf('Antall 5-kroninger: %d\n',five)
fprintf('Antall 1-kroninger: %d\n',one)
end