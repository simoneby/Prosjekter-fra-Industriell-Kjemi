% purpose: Brukt til ? vise om partialtrykket til CO2 i gassfase vil 
%          ?ke eller minke med ?kende mengde av abosrbert CO2 i v?skefasen.
% authors: ME
% date: 18.april.2016

function p = trykk(alfa) %regner ut p(CO2) ved ?kende abs. CO2
Kh = 1;
K2= 1;
p = (Kh*(alfa)^2)/(K2*(1-2*alfa)^2);

end