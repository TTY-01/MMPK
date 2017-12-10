%% Probability of wrong color observation 
clear all
close all

x = 1:1:50;
p = 1/1000;
P0 = (1-p).^(x);

figure
plot(x, P0, '.', 'MarkerSize', 15)
title('Todenn�k�isyys, ett� v�rihavaintoja v��rin 0 kpl ')
xlabel('Askelia')
ylabel('Todenn�k�isyys')
legend('P(X=0)')


%% Verification step analysis

p = 1/4;
P = [p^0 p^1 p^2 p^3 p^4 p^5]
x = 0:1:5;

figure
plot(x,P, 'b.', 'MarkerSize', 15);
title({'Todenn�k�isyys, ett� j�ljelle j��v� virheellinen ruutu', 'n�ytt�� oikealta tarkistus askeleen i funktiona'});
xlabel('Askel i')
ylabel('Todenn�k�isyys')
legend('P = (1/4)^i')