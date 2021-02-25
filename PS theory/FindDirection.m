function direction = FindDirection(S,D)

direction = 0;

load Net;

% current start node
Node = zeros(4,1);
Node(1,1) = S;
Node(2,1) = Net(S,1);
Node(3,1) = Net(S,2);
Node(4,1) = Net(S,3);

% destination node
Destination = zeros(4,1);
Destination(1,1) = D;
Destination(2,1) = Net(D,1);
Destination(3,1) = Net(D,2);
Destination(4,1) = Net(D,3);

if (Node(2,1)<=Destination(2,1)) && (Node(3,1)<Destination(3,1))
    direction = 1;
else
    if (Node(2,1)<Destination(2,1)) && (Node(3,1)>=Destination(3,1))
        direction = 2;
    else
        if (Node(2,1)>=Destination(2,1)) && (Node(3,1)>Destination(3,1))
           direction = 3;
        else
           if (Node(2,1)>Destination(2,1)) && (Node(3,1)<=Destination(3,1))
            	direction = 4;
            end
        end
    end
end