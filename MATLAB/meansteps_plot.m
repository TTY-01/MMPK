%% Initializing values
clear all
close all

data = read_data();
stepsmean = mean(data);

stepsmean100 = stepsmean(5:100);
x100 = 5:1:100;
[f100, gof100] = fit(x100.', stepsmean100.', 'power2');

stepsmean500 = stepsmean(5:140);
x500 = [x100 (110:10:500)];
[f500, gof500] = fit(x500.', stepsmean500.', 'power2');

stepsmean1000 = stepsmean(5:150);
x1000 = [x500 (550:50:1000)];
[f1000, gof1000] = fit(x1000.', stepsmean1000.', 'power2');

stepsmean5000 = stepsmean(5:153);
x5000 = [x1000 2000 3500 5000];
[f5000, gof5000] = fit(x5000.', stepsmean5000.', 'power2');


%% Plotting results

figure % figure 1
plot(x100, stepsmean100, '.', 'MarkerSize', 10);
axis([5 100 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo')

figure % figure 2
plot(x500, stepsmean500, '.', 'MarkerSize', 10);
axis([5 500 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo');

figure % figure 3
plot(x1000, stepsmean1000, '.', 'MarkerSize', 10);
axis([5 1000 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo');

figure % figure 4
plot(x5000, stepsmean5000, '.', 'MarkerSize', 10);
axis([5 5000 0 30])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo');


%% Plotting power2 fits to data

figure % figure 5
plot100 = plot(f100, x100, stepsmean100);
set(plot100, {'LineWidth'}, {1}, {'MarkerSize'}, {10})
axis([5 100 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo', 'y = ax^b+c, a = 64.811, b = 0.033, c = -64.021, R_2 = 0.9965')
RS100 = gof100.rsquare;

figure % figure 6
plot500 = plot(f500, x500, stepsmean500);
set(plot500, {'LineWidth'}, {1}, {'MarkerSize'}, {10})
axis([5 500 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo', 'y = ax^b+c, a = 37.640, b = 0.053, c = -36.625, R_2 = 0.9984')
RS500 = gof500.rsquare;

figure % figure 7
plot1000 = plot(f1000, x1000, stepsmean1000);
set(plot1000, {'LineWidth'}, {1}, {'MarkerSize'}, {10})
axis([5 1000 0 20])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo', 'y = ax^b+c, a = 41.446, b = 0.049, c = -40.494, R_2 = 0.9986')
RS1000 = gof1000.rsquare;

figure % figure 8
plot5000 = plot(f5000, x5000, stepsmean5000);
set(plot5000, {'LineWidth'}, {1}, {'MarkerSize'}, {10})
axis([5 5000 0 30])
title('Sijainnin lˆytymiseksi tarvittava keskim‰‰r‰inen askelm‰‰r‰')
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('1000:n simuloidun tuloksen keskiarvo', 'y = ax^b+c, a = 48.698, b = 0.043, c = -47.858, R_2 = 0.9987')
RS5000 = gof5000.rsquare;


%% Predictions for large maps

figure
x = 5:1:10000;
plot10000 = plot(f5000(x));
set(plot10000, {'LineWidth'}, {2})
axis([0 10000 0 30])
title({'Sovitteen arvio sijainnin lˆytymiseksi' 'tarvittavasta keskim‰‰r‰isest‰ askelm‰‰r‰st‰'})
xlabel('Kartan sivun pituus');
ylabel('Keskim‰‰r‰inen askelm‰‰r‰');
legend('y = ax^b+c, a = 48.698, b = 0.043, c = -47.858, R_2 = 0.9987')