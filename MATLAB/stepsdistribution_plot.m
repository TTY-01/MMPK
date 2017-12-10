%% Initializing values
clear all
close all

% Initializing data
data100 = dlmread('datat/dist100.txt', ' ');
data100 = data100(1:10000);
data200 = dlmread('datat/dist200.txt', ' ');
data200 = data200(1:10000);
data500 = dlmread('datat/dist500.txt', ' ');
data500 = data500(1:10000);
data1000 = dlmread('datat/dist1000.txt', ' ');
data1000 = data1000(1:10000);

% number of unique elements in data vectors
nbins100 = length(unique(data100)); 
nbins200 = length(unique(data200)); 
nbins500 = length(unique(data500)); 
nbins1000 = length(unique(data1000)); 

% u-vectors contain unique elements of data vectors in rising order 
u100 = unique(data100);
u200 = unique(data200);
u500 = unique(data500);
u1000 = unique(data1000);

% count-vectors contain number of occurances for unique values in
% data-vectors
count100 = zeros(1, nbins100);
count200 = zeros(1, nbins200);
count500 = zeros(1, nbins500);
count1000 = zeros(1, nbins1000);

for i = 1:1:nbins100
    count100(1, i) = sum(data100(1,:) == u100(i));
end

for i = 1:1:nbins200
    count200(1, i) = sum(data200(1,:) == u200(i));
end

for i = 1:1:nbins500
    count500(1, i) = sum(data500(1,:) == u500(i));
end

for i = 1:1:nbins1000
    count1000(1, i) = sum(data1000(1,:) == u1000(i));
end

% x-values for poisson dist.
x = 1:1:40;

% lambda values of data vectors for poisson distribution
[lambda100, lci100] = poissfit(data100);
[lambda200, lci200] = poissfit(data200);
[lambda500, lci500] = poissfit(data500);
[lambda1000, lci1000] = poissfit(data1000);

% poisson dist. fit, 95% confidence intervals
f100 = lambda100.^(x)./factorial(x).*exp(-lambda100);
f200 = lambda200.^(x)./factorial(x).*exp(-lambda200);
f500 = lambda500.^(x)./factorial(x).*exp(-lambda500);
f1000 = lambda1000.^(x)./factorial(x).*exp(-lambda1000);

%% Plotting histograms
figure
histogram(data100, nbins100, 'BinWidth', 1);
axis([0 40 0 inf])
title('Askelm‰‰r‰ jakauma, 100x100 kartta, 10000 simulointia')
xlabel('Askelm‰‰r‰')
ylabel('Tapahtumien lkm')

figure
histogram(data200, nbins200, 'BinWidth', 1);
axis([0 40 0 inf])
title('Askelm‰‰r‰ jakauma, 200x200 kartta, 10000 simulointia')
xlabel('Askelm‰‰r‰')
ylabel('Tapahtumien lkm')

figure
histogram(data500, nbins500, 'BinWidth', 1);
axis([0 40 0 inf])
title('Askelm‰‰r‰ jakauma, 500x500 kartta, 10000 simulointia')
xlabel('Askelm‰‰r‰')
ylabel('Tapahtumien lkm')

figure
histogram(data1000, nbins1000, 'BinWidth', 1);
axis([0 40 0 inf])
title('Askelm‰‰r‰ jakauma, 1000x1000 kartta, 10000 simulointia')
xlabel('Askelm‰‰r‰')
ylabel('Tapahtumien lkm')

%% Plotting data-points with poisson dist. fit

figure % 100x100
plot(u100, count100/10000, '.', 'MarkerSize', 15);
hold on;
plot(x,f100,'r.', 'MarkerSize', 15);
plot(x,f100,'r-.', 'LineWidth', 1);
axis([0 40 0 0.12])
title('Askelm‰‰r‰ jakauma, 100x100 kartta')
xlabel('Askelm‰‰r‰')
ylabel('Todenn‰kˆisyys')
legend('10000:n simuloinnin tulos', 'Poisson-sovitus, lambda = 11.5431 ')


figure % 200x200
plot(u200, count200/10000, '.', 'MarkerSize', 15);
hold on;
plot(x,f200,'r.', 'MarkerSize', 15);
plot(x,f200,'r-.', 'LineWidth', 1);
axis([0 40 0 0.12])
title('Askelm‰‰r‰ jakauma, 200x200 kartta')
xlabel('Askelm‰‰r‰')
ylabel('Todenn‰kˆisyys')
legend('10000:n simuloinnin tulos', 'Poisson-sovitus, lambda = 13.4185 ')


figure % 500x500
plot(u500, count500/10000, '.', 'MarkerSize', 15);
hold on;
plot(x,f500,'r-.', 'LineWidth', 1);
plot(x,f500,'r.', 'MarkerSize', 15);
axis([0 40 0 0.12])
title('Askelm‰‰r‰ jakauma, 500x500 kartta')
xlabel('Askelm‰‰r‰')
ylabel('Todenn‰kˆisyys')
legend('10000:n simuloinnin tulos', 'Poisson-sovitus, lambda = 15.7955 ')


figure % 1000x1000
plot(u1000, count1000/10000, '.', 'MarkerSize', 15);
hold on;
plot(x, f1000,'r-.', 'LineWidth', 1);
plot(x, f1000,'r.', 'MarkerSize', 15);
axis([0 40 0 0.1])
title('Askelm‰‰r‰ jakauma, 1000x1000 kartta')
xlabel('Askelm‰‰r‰')
ylabel('Todenn‰kˆisyys')
legend('10000:n simuloinnin tulos', 'Poisson-sovitus, lambda = 17.7437 ')

%% Calculating standard deviations for step distributions

s100 = std(data100);
s200 = std(data200);
s500 = std(data500);
s1000 = std(data1000);
