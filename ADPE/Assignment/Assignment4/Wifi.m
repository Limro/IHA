clear, clc

DataFile = 'RSSIdata.csv';

data = csvread(DataFile);
x = 1:1:size(data,1);		% Le data

MeanMat = zeros(1,6);		% Array initialization
MedianMat = zeros(1,6);		% Array initialization

% Do 6 runs with frame size 1, 3, 5, 7, 9 and 11
for i = 1:6
	tempData = data;						% data will be destroyed
    steps = size(tempData,1)/(i+i-1);		
	remain = mod(steps,1);					% Get whole number steps 
	while remain > 0						% If not - remove data until it fits >:@
		tempData = tempData(1:end-1);
		steps = size(tempData,1)/ceil(i+i-1);
		remain = mod(steps,1);
	end										% there we go
	
	% Split data up into 'steps' rows
	ReshapenData = reshape(tempData,i+i-1,size(tempData,1)/ceil(i+i-1));
	
	% Get the mean value of the mean value
	MeanArr = mean(ReshapenData,1);
	MeanMat(1,i) = mean(MeanArr);
	
	% Get the median of the median
	MedianArr = median(ReshapenData,1);
	MedianMat(1,i) = median(MedianArr);
end
MeanMat
MedianMat



% figure(1)
% for j = 3 : 3
% %     subplot(2,3,j)
%     plot(x, data, 'r')
%     hold on
% 
%     oldMean = 0;
%     oldMedian = 0;
% 
%     stepSize = j+j-1;
%     for i = 1 : stepSize : size(data,1)-stepSize
% 
%         meanValue = mean(data(i:i+stepSize));
%         medianValue = median(data(i:i+stepSize));
% 
% %         line('XData', [i i+stepSize-1], ...
% %             'YData', [meanValue meanValue], ...
% %             'LineStyle', '-', ...
% %             'LineWidth', 1, ...
% %             'Color','g')
% % 
% %         line('XData', [i i+stepSize-1], ... %[from to]
% %             'YData', [medianValue medianValue], ... %[from to]
% %             'LineStyle', '-', ...
% %             'LineWidth', 1, ...
% %             'Color','b')
% % 
% %         if oldMedian < 0
% %             line('XData', [i-1 i], ...
% %                 'YData', [oldMean meanValue], ...
% %                 'LineStyle', '-', ...
% %                 'LineWidth', 1, ...
% %                 'Color','g')
% % 
% %             line('XData', [i-1 i], ... %[from to]
% %                 'YData', [oldMedian medianValue], ... %[from to]
% %                 'LineStyle', '-', ...
% %                 'LineWidth', 1, ...
% %                 'Color','b')
% %         end
% % 
% %         oldMean = meanValue;
% %         oldMedian = medianValue;
%     end
%     % Add a title and axis labels
%     str = sprintf('Frame size %i',j+(j-1));
%     title(str)
%     xlabel('Time')
%     ylabel('RSSI, dBm')
%     legend('Raw data', 'Mean value', 'Median value', ...
%         'Location','northeast');
% 
% end

% figure(2)
% plot(x, data, 'r')
% hold on
% for i = 1 : stepSize : size(data,1)-stepSize
%     e = std(data(i:i+stepSize-1))*ones(size(x(i:i+stepSize-1)));
%     errorbar(x(i:i+stepSize-1), data(i:i+stepSize-1), e, 'b');
% end
% 
% 
% % Add a title and axis labels
% title('Fixed Wifi data - standard deviation')
% xlabel('Time')
% ylabel('RSSI, dBm')
% legend('Raw data', 'Standard deviation', ...
%     'Location','southwest');

%% Eksempel 1 ? sammenligning af to middelvErdier (kendt varians )
% mu1 = 3;
% n1 = 20;
% mu2 = 4;
% n2 = 10;
% sigma = 1;
% u = 1.96;
% 
% % Simulerede data
% x1 = randn(1,n1)*sigma + mu1;
% x2 = randn(1,n2)*sigma + mu2;
% 
% % ParameterskQn (middelvErdi)
% x1_bar = mean(x1);
% x2_bar = mean(x2);
% 
% % TeststQrrelse (H: mu1 = mu2)
% z = (x1_bar-x2_bar)/(sigma*sqrt(1/n1+1/n2))
% pval = 2*(1-normcdf(abs(z)))
% 
% % 95% konfidensinterval
% d_nedre = x1_bar-x2_bar - u*sigma*sqrt(1/n1+1/n2)
% d_oevre = x1_bar-x2_bar + u*sigma*sqrt(1/n1+1/n2)

% %plot
% figure
% plot(1, x1, 'b.', 2, x2, 'r.' ,1, x1_bar, 'b+', 2, x2_bar, 'r+')
% axis([0.5 2.5 1.1*min([x1 x2]) 1.1*max([x1 x2])])
