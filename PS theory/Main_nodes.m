clc;

% the number of road segments (nodes)
n = 220;

% scope of the road network 0~x/y/z
% 1 unit = 10m
x = 100;
y = 100;
z = 0; % if no Z axis, set z=0

% energy level (other properties) /residual energy
energy_level = 4; %Property f1 has four property categories

% energy cost /energy consumption
energy_cost = 3; %Property f2 has three property categories

% if already have the Net map
%load Net;

% % % define the network(Net)
% % DefineNet(n,x,y,0);
% % 
% % % set the other property of nodes (energy)(Net,Net_location,Property)
% % % four residual energy levels are set in this example, like Low, Medium, Rich and
% % % Unlimited.
% % % three energy consumption levels are set in this example as high, middle and low
% % % consumption.
% % InputProperty(n,energy_level,energy_cost);
% % 
% % % order nodes by location(Net)
% % OrderNodes(n);

% draw the network with property defined in colors and shapes(Net)
% 3 different colors have been set now: g-green b-blue r-red
% 4 different shapes have been set now: * pentagram circle square
% property_number = energy_level * energy_cost
property_number = 12; 
DrawNetWithProperty(n,property_number);% draw the road network
area = 10; % length of covered area

% Source node & Destination node
S = 7; %Source node
D = 183; %Destination node

% contrast between PS-based routing and traditional routing
% flag = 1 improved PS-based routing
flag = 1;
FindRoute(S,D,area,energy_level,n,1,energy_cost,flag);%参数：起点，终点，覆盖区域的长度，，，，
DrawRoute(n,energy_level,1);
hold on;
% falg = 0 traditional routing-- GFR
flag = 0;
FindRoute(S,D,area,energy_level,n,1,energy_cost,flag);
DrawRouteNon(n,energy_level,1);
hold on;
% flag = 2 PS-based routing
% flag = 2;
% FindRoute(S,D,area,energy_level,n,1,energy_cost,flag);
% DrawRoute_3(n,energy_level,1);

