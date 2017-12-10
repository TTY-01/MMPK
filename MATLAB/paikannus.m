clear all
close all

data = read_data();

stepsmean = mean(data);
stepsmean100 = stepsmean(5:100);
x100 = 5:1:100;

stepsmean500 = stepsmean(5:140);
x500 = [x100 (110:10:500)];

stepsmean1000 = stepsmean(5:150);
x1000 = [x500 (550:50:1000)];

figure % figure 1
plot(x100, stepsmean100, '.');
axis([5 100 0 20])
title('Sijainnin löytymiseksi tarvittava keskimääräinen askelmäärä')
xlabel('Kartan sivun pituus');
ylabel('Keskimääräinen askelmäärä');
legend('1000:n simuloidun tuloksen keskiarvo')

figure % figure 2
plot(x500, stepsmean500, '.', 'MarkerSize', 2);
axis([5 500 0 20])
title('Sijainnin löytymiseksi tarvittava keskimääräinen askelmäärä')
xlabel('Kartan sivun pituus');
ylabel('Keskimääräinen askelmäärä');
legend('1000:n simuloidun tuloksen keskiarvo');

figure % figure 3
plot(x1000, stepsmean1000, '.');
axis([5 1000 0 20])
title('Sijainnin löytymiseksi tarvittava keskimääräinen askelmäärä')
xlabel('Kartan sivun pituus');
ylabel('Keskimääräinen askelmäärä');
legend('1000:n simuloidun tuloksen keskiarvo');
