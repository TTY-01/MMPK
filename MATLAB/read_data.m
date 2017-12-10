function [ data ] = read_data()
%READ_DATA used to read data-files used in paikannus-assignment.

data = zeros(1000,153);
j = 5;

for i = 5:1:100
    filename = strcat('datat/data', int2str(i), '.txt');
    datarow = dlmread(filename, ' ');
    datarow = datarow(1:1000);
    data(:, j) = datarow;
    j = j + 1;
end

for i = 110:10:500
    filename = strcat('datat/data', int2str(i), '.txt');
    datarow = dlmread(filename, ' ');
    datarow = datarow(1:1000);
    data(:, j) = datarow;
    j = j + 1;
end

for i = 550:50:1000
    filename = strcat('datat/data', int2str(i), '.txt');
    datarow = dlmread(filename, ' ');
    datarow = datarow(1:1000);
    data(:, j) = datarow;
    j = j + 1;
end

data2000 = dlmread('datat/data2000.txt', ' ');
data(:, 151) = data2000(1:1000);
data3500 = dlmread('datat/data3500.txt', ' ');
data(:, 152) = data3500(1:1000);
data5000 = dlmread('datat/data5000.txt', ' ');
data(:, 153) = data5000(1:1000);

end

