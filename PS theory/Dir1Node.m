function node = Dir1Node(S,D,area,Property,Property_2,energy_level,flag)

load Net;

% current start node
Source = zeros(5,1);
Source(1,1) = S;
Source(2,1) = Net(S,1);
Source(3,1) = Net(S,2);
Source(4,1) = Net(S,3);
Source(5,1) = Net(S,4);

if (Source(2,1)+area)>=Net(D,1) && (Source(3,1)+area)>=Net(D,2) && flag ==1%����յ��ڸ��������ڣ���ֱ�����յ�
    % if the destination
    node = D;
else
    % length of the Net
    b = size(Net,1);%400
    a = 1;
    % left edge
    aim_start = Source(2,1);%�����Ϊ��׼�������ϽǷ��򣬽���һ����������
    % right edge
    aim_end = Source(2,1)+area;
    % bottom
    aim_y1 = Source(3,1);
    % top
    aim_y2 = Source(3,1)+area;
    node_start = FindStartNode(a,b,aim_start);%�ҵ�������������һ����
    flag_list = NodeLists(S,aim_start,aim_end,aim_y1,aim_y2);
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
            node = FindBestNodes(S);
            % direction = 1
%             node = FindBestNodes_2(1);%�ҳ�����ͷ�������ʵ��Ǹ���
        end
    end
end