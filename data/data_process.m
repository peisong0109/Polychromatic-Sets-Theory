Net=xlsread('road2_avoid.xlsx');
size_Net = size(Net,1);
size_Net2 = size(Net,2);

save('Net.mat','Net')

load Net
for i = 201:216
    scatter(Net(i,1),Net(i,2),'b');
    text(Net(i,1),Net(i,2),[num2str(i)])
    hold on
end
scatter(100,150,'b');
scatter(100,50,'b');
scatter(220,150,'b');
scatter(220,50,'b');