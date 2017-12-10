%% Initializing values
clear all
close all

u10 = 5.890543143323157e-04; % portion of expected possibilities left after 10 moves;
n100 = 100*100;
n200 = 200*200;
n500 = 500*500;
n1000 = 1000*1000;
E100 = u10 * n100;
E200 = u10 * n200;
E500 = u10 * n500;
E1000 = u10 * n1000;

x = 0:0.01:1000;
norm100 = normpdf(x,E100,2);
norm200 = normpdf(x,E200,2);
norm500 = normpdf(x,E500,2);
norm1000 = normpdf(x,E1000,2);

%% Plotting normal distribution approximations
figure; % figure 1
plot(x,norm100, 'LineWidth', 2);
axis([E100-10 E100+10 0 0.25])
title('Kartta 100x100, mahdollisuuksien lkm odotusarvo 10 siirron jälkeen')
xlabel('Mahdollisuuksien lkm')
ylabel('Todennäköisyys')
legend('Normaalijakauma approx. E = 5.89, var = 2')

figure; % figure 2
plot(x,norm200, 'LineWidth', 2);
axis([E200-10 E200+10 0 0.25])
title('Kartta 200x200, mahdollisuuksien lkm odotusarvo 10 siirron jälkeen')
xlabel('Mahdollisuuksien lkm')
ylabel('Todennäköisyys')
legend('Normaalijakauma approx. E = 23.56, var = 2')

figure; % figure 3
plot(x,norm500, 'LineWidth', 2);
axis([E500-10 E500+10 0 0.25])
title('Kartta 500x500, mahdollisuuksien lkm odotusarvo 10 siirron jälkeen')
xlabel('Mahdollisuuksien lkm')
ylabel('Todennäköisyys')
legend('Normaalijakauma approx. E = 147.26, var = 2')

figure; % figure 4
plot(x,norm1000, 'LineWidth', 2);
axis([E1000-10 E1000+10 0 0.25])
title('Kartta 1000x1000, mahdollisuuksien lkm odotusarvo 10 siirron jälkeen')
xlabel('Mahdollisuuksien lkm')
ylabel('Todennäköisyys')
legend('Normaalijakauma approx. E = 589.05, var = 2')