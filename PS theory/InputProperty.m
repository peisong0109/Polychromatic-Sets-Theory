function InputProperty = InputProperty(n,property_level,energy_cost)

load Net;

Property = zeros(n,2);

for i=1:n
    Property(i,1) = ceil(rand*property_level);
    Property(i,2) = ceil(rand*energy_cost);
end

Net_location = Net;
save('Net_location.mat','Net_location');
save('Property.mat','Property');

Net = [Net,Property];
save('Net.mat','Net');