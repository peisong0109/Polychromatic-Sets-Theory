function DrawRoute = DrawRoute_3(n,energy_level,links)

links = int2str(links);
string = ['load Route_',links,';'];
eval(string);

num = size(Route,2);
for i = 1:num-1
    A = [Route(2,i),Route(2,i+1)];
    B = [Route(3,i),Route(3,i+1)];
%     distance = calculate_distance(Route(2,i),Route(3,i),Route(2,i+1),Route(3,i+1));
    plot(A,B,'g');
    text(Route(2,1),Route(3,1),['S']);
    text(Route(2,num),Route(3,num),['D']);
%     text(Route(2,i+1),Route(3,i+1),[num2str(distance)]);
end