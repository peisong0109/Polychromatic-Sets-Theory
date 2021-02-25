function node = Dir1Node(S,D,area,Property,Property_2,energy_level,flag)

load Net;

% current start node
Source = zeros(5,1);
Source(1,1) = S;
Source(2,1) = Net(S,1);
Source(3,1) = Net(S,2);
Source(4,1) = Net(S,3);
Source(5,1) = Net(S,4);

if (Source(2,1)+area)>=Net(D,1) && (Source(3,1)+area)>=Net(D,2) && flag ==1%如果终点在覆盖区域内，则直接连终点
    % if the destination
    node = D;
else
    % length of the Net
    b = size(Net,1);%400
    a = 1;
    % left edge
    aim_start = Source(2,1);%以起点为基准，往右上角方向，建立一个方形区域
    % right edge
    aim_end = Source(2,1)+area;
    % bottom
    aim_y1 = Source(3,1);
    % top
    aim_y2 = Source(3,1)+area;
    node_start = FindStartNode(a,b,aim_start);%找到从左往右数第一个点
    flag_list = NodeLists(S,aim_start,aim_end,aim_y1,aim_y2);
    if flag_list == -1
        node = -1;%在这个区域内没有下一个点了
    else

        if size(Property,2) == 1
            flag_list2 = GetNodeByPSet(Property,Property_2,energy_level);%通过PS的概念，找到区域内最合适的那几个点===================用自己的程序来替换
        else
            flag_list2 = GetNodeByPSet_2(Property,Property_2,energy_level);
%             x1 = 1
        end
        if flag_list2 == -1
            node = -1;
        else
            node = FindBestNodes(S);
            % direction = 1
%             node = FindBestNodes_2(1);%找出距离和方向最合适的那个点
        end
    end
end