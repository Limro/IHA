clear, clc, clf

DataFile = 'RSSIdata.csv';

data = csvread(DataFile);
x = 1:1:size(data,1);

mean = mean(data)
median = median(data)
e = std(data)*ones(size(x));

%%

figure(1)
plot(x, data, 'r')
hold on
line('XData', [0 size(data,1)], ...
    'YData', [mean mean], ...
    'LineStyle', '-', ...
    'LineWidth', 1.5, ...
    'Color','g')

line('XData', [0 size(data,1)], ... %[from to]
    'YData', [median median], ... %[from to]
    'LineStyle', '-', ...
    'LineWidth', 1.5, ...
    'Color','b')
% errorbar(x, data, e);


% Add a title and axis labels
title('Closed loop response')
xlabel('Time')
ylabel('RSSI, dBm')
legend('Raw data', 'Mean value', 'Median value', 'Standard deviation');



