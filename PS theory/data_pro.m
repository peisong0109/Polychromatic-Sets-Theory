%Net数据处理
load Net;
Net_copy = zeros(400,5);
size_Net = size(Net,1);
for i=1:size_Net
    for j=1:4
        Net_copy(i,j) = Net(i,j);
    end
end
Net_copy(3,5) = 1;
Net_copy(19,5) = 1;
Net_copy(55,5) = 1;
Net_copy(23,5) = 1;
Net_copy(4,5) = 1;
Net_copy(13,5) = 1;
Net_copy(29,5) = 1;
Net_copy(35,5) = 1;

Net = zeros(400,5);
Net = Net_copy;

save('Net.mat','Net');