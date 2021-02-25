function DefineNet = DefineNet(n,x,y,z)

if z == 0
    Net = zeros(n,2);
    for i = 1:n
        Net(i,1) = round(rand*x);
        Net(i,2) = round(rand*y);
    end
else
    Net = zeros(n,3);
    for i = 1:n
        Net(i,1) = round(rand*x);
        Net(i,2) = round(rand*y);
        Net(i,3) = round(rand*z);
    end
end

save('Net.mat','Net');