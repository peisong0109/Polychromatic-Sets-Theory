%Ѱ�ҵ�һ��ڶ����ȼ��ĵ�
function flag_list2 = GetNodeByPSet_mode2(Property,Property_2,energy_level)

load NodeList;%5��n�У���һ���ǵ�����

flag_list2 = 1;
element = size(NodeList,2);
%elements = element +1;
PSet_Creat(energy_level+1,element,'NodeList_PSet');%�����յĶ�ɫ����n+1��7+1�У������һ�д洢������

load NodeList_PSet_Set;

for i = 1:element%Ϊ��ɫ����ֵ����ԭ�е�ֵ��ӽ�ȥ
    NodeList_PSet_Set(i,energy_level+1) = NodeList(1,i);%��ÿ���ڵ����ŷ������һ��
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

%�󲢼������Ƿ�������Ҫ��Ľڵ�
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
    flag_list2 = -1;%�������Ϊ0��˵��û�к��ʵĵ�
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