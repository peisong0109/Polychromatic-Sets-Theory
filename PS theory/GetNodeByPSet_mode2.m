%寻找第一或第二优先级的点
function flag_list2 = GetNodeByPSet_mode2(Property,Property_2,energy_level)

load NodeList;%5行n列，第一行是点的序号

flag_list2 = 1;
element = size(NodeList,2);
%elements = element +1;
PSet_Creat(energy_level+1,element,'NodeList_PSet');%建立空的多色集，n+1行7+1列，多的那一列存储点的序号

load NodeList_PSet_Set;

for i = 1:element%为多色集赋值，其原有的值添加进去
    NodeList_PSet_Set(i,energy_level+1) = NodeList(1,i);%将每个节点的序号放在最后一列
    for j = 1:4
        if j == NodeList(4,i)
            NodeList_PSet_Set(i,j) = 1;
        else
            NodeList_PSet_Set(i,j) = 0;
        end
    end
    for j = 5:energy_level
        % energy_level_original = 4
        if j == NodeList(5,i) + 4
            NodeList_PSet_Set(i,j) = 1;
        else
            NodeList_PSet_Set(i,j) = 0;
        end
    end
end
save('NodeList_PSet_Set.mat','NodeList_PSet_Set');

%求并集，看是否有满足要求的节点
Nodes_selected = zeros(1,element);
for i = 1:element
    if NodeList_PSet_Set(i,Property) && NodeList_PSet_Set(i,Property_2) == 1
        Nodes_selected(1,i) = NodeList(1,i);
    end
end
        
%save('NodeList_PSet_Set.mat','NodeList_PSet_Set');


number = 0;
for i = 1:element
    if Nodes_selected(1,i) ~= 0
        number = number+1;
    end
end
if number == 0
    flag_list2 = -1;%如果列数为0，说明没有合适的点
else
    j = 1;
    FindBestNode = zeros(2,number);
    for i = 1:element
        if Nodes_selected(1,i) ~= 0
            FindBestNode(1,j) = Nodes_selected(1,i);
            j = j + 1;
        end
    end
    save('FindBestNode.mat','FindBestNode');
end