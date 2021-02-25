function OrderNodes = OrderNodes(n)

load Net;

for i = 1:n
    for j = 1:(n-i)
        if Net(j,1) > Net(j+1,1)
            mdata = Net(j,1); Net(j,1) = Net(j+1,1); Net(j+1,1) = mdata;
            mdata = Net(j,2); Net(j,2) = Net(j+1,2); Net(j+1,2) = mdata;
            mdata = Net(j,3); Net(j,3) = Net(j+1,3); Net(j+1,3) = mdata;
            mdata = Net(j,4); Net(j,4) = Net(j+1,4); Net(j+1,4) = mdata;
        end
    end
end

% only order by x, as it may cost more than search the nodes loop by ordered by y again
% if necessary, order by y in this area

save('Net.mat','Net');