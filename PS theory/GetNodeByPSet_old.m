function flag_list2 = GetNodeByPSet_old(Property,Property_2,energy_level)

load NodeList;

flag_list2 = 1;
element = size(NodeList,2);
elements = element +1;
PSet_Creat(energy_level,elements,'NodeList_PSet');%�����յĶ�ɫ����n+1��7��

load NodeList_PSet_Set;

for i = 1:element%Ϊ��ɫ����ֵ����ԭ�е�ֵ��ӽ�ȥ
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
% one node / start node / connnect node
for j = 1:energy_level%��ӵ���һ��ֵȫ����Ϊ1
        NodeList_PSet_Set(elements,j) = 1;
end

save('NodeList_PSet_Set.mat','NodeList_PSet_Set');

% Define Element Group and Property Group (by sequence!!!)
Element_Group.number = 2;%���������еĵ��Ϊһ�飬��ӵ�һ�����Ϊһ��
Element_Group.Group1 = 1:element;
Element_Group.Group2 = elements;

Property_Group.number = 2;
Property_Group.Group1 = Property;
Property_Group.Group2 = Property_2;

PSet_AFA_to_AAF(Element_Group,Property_Group,'NodeList_PSet','NodeList_PSet_result');


load NodeList_PSet_result_Set;
if size(NodeList_PSet_result_Set,2) == 0
    flag_list2 = -1;%�������Ϊ0��˵��û�к��ʵĵ�
else
    num = size(NodeList_PSet_result_Set,2);
    FindBestNode = zeros(2,num);%2��2��
    for i = 1:num
        j = 1;
        while 1
            if NodeList_PSet_result_Set(j,i) == 1%����ÿһ�У������һ������1����Ѷ�Ӧ����1�еĽڵ��ó��������ȫΪ0������
                FindBestNode(1,i) = NodeList(1,j);
                break;
            end
            j = j+1;
        end
    end%ͨ����һ�Σ�ѡ�������ó����ĵ�
    save('FindBestNode.mat','FindBestNode');
end