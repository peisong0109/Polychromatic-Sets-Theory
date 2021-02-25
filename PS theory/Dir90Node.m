%先搜索90°区域
function node = Dir90Node(S,D,area,Property,Property_2,energy_level,flag)

load Net;

% current start node
% Source = zeros(5,1);
% Source(1,1) = S;
% Source(2,1) = Net(S,1);
% Source(3,1) = Net(S,2);
% Source(4,1) = Net(S,3);
% Source(5,1) = Net(S,4);

%先看终点在不在区域内
if calculate_distance(Net(S,1),Net(S,2),Net(D,1),Net(D,2)) <= area && flag ==1%如果终点在覆盖区域内，则直接连终点
    node = D;
else
    flag_list = NodeLists_2(S,D,area,90);
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
            % direction = 1
            node = FindBestNodes(S);%找出距离和方向最合适的那个点
        end
    end
end
        
