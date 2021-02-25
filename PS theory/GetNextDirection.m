function neighbour = GetNextDirection(S,D,Dir)

load Net;
neighbour = -1;

% current start node
Source = zeros(4,1);
Source(1,1) = S;
Source(2,1) = Net(S,1);
Source(3,1) = Net(S,2);
Source(4,1) = Net(S,3);

% destination
Destination = zeros(4,1);
Destination(1,1) = D;
Destination(2,1) = Net(D,1);
Destination(3,1) = Net(D,2);
Destination(4,1) = Net(D,3);

switch Dir
    case 1
        if Destination(2,1)-Source(2,1) <= Destination(3,1)-Source(3,1)
            neighbour = 4;
        else
            neighbour = 2;
        end
    case 2
        if Destination(2,1)-Source(2,1) >= Source(3,1)-Destination(3,1)
            neighbour = 1;
        else
            neighbour = 3;
        end
    case 3
        if Source(2,1)-Destination(2,1) <= Source(3,1)-Destination(3,1)
            neighbour = 2;
        else
            neighbour = 4;
        end
    case 4
        if Source(2,1)-Destination(2,1) >= Destination(3,1)-Source(3,1)
            neighbour = 3;
        else
            neighbour = 1;
        end
    otherwise
        disp('Error Direction!');
end