function node_start = FindStartNode(a,b,aim)

load Net;

while 1
	ab = a+b;
	ab2 = fix(ab/2);
	if Net(ab2,1) == aim
        % find one node on the left edge
        node = ab2;
        break;
    end
	if Net(ab2,1) < aim
        a = ab2;
        if Net(b,1) > aim && Net(a,1) < aim && b-a == 1
            node = b;
            break;
        end
    else
        b = ab2;
        if a == b && b == 1
            node = b;
            break;
        end
	end
end

% find the first node on the left edge
if node ~= 1
    while Net(node-1,1) == Net(node,1)
        node = node - 1;
        if node == 1
            break;
        end
    end
end
node_start = node;