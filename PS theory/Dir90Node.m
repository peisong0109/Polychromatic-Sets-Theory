%������90������
function node = Dir90Node(S,D,area,Property,Property_2,energy_level,flag)

load Net;

% current start node
% Source = zeros(5,1);
% Source(1,1) = S;
% Source(2,1) = Net(S,1);
% Source(3,1) = Net(S,2);
% Source(4,1) = Net(S,3);
% Source(5,1) = Net(S,4);

%�ȿ��յ��ڲ���������
if calculate_distance(Net(S,1),Net(S,2),Net(D,1),Net(D,2)) <= area && flag ==1%����յ��ڸ��������ڣ���ֱ�����յ�
    node = D;
else
    flag_list = NodeLists_2(S,D,area,90);
    if flag_list == -1
        node = -1;%�����������û����һ������
    else
        
        if size(Property,2) == 1
            flag_list2 = GetNodeByPSet(Property,Property_2,energy_level);%ͨ��PS�ĸ���ҵ�����������ʵ��Ǽ�����===================���Լ��ĳ������滻
        else
            flag_list2 = GetNodeByPSet_2(Property,Property_2,energy_level);
            %             x1 = 1
        end
        if flag_list2 == -1
            node = -1;
        else
            % direction = 1
            node = FindBestNodes(S);%�ҳ�����ͷ�������ʵ��Ǹ���
        end
    end
end
        
