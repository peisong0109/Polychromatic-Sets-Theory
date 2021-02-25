function [Source, Destination] = RandomSD(n,flag)

Source = ceil(rand*n);

while 1
    Destination = ceil(rand*n);
    if Source ~= Destination
        break;
    end
end

if flag == 1
    load Net;
    Source
    Source_X = Net(Source,1)
    Source_Y = Net(Source,2)
    Source_Property = Net(Source,3)
    Source_EnergyCost = Net(Source,4)
    Destination
    Destination_X = Net(Destination,1)
    Destination_Y = Net(Destination,2)
    Destination_Property = Net(Destination,3)
    Destination_EnergyCost = Net(Destination,4)
end