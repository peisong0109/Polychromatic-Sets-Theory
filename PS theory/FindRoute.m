function FindRoute = FindRoute(S,D,area,energy_level,n_node,links,energy_cost,flag)

load Net; %load the road network

% copy Net
[a,b]=size(Net);
Net_copy = zeros(a,b);
for i = 1:a
    for j = 1:b
        Net_copy(i,j) = Net(i,j);
    end
end

n_hops = 0;

% a selected node
Node = zeros(5,1);
Node(1,1) = S; %the Serial number of the source node
Node(2,1) = Net(S,1); % the position of the node
Node(3,1) = Net(S,2); % the position of the node
Node(4,1) = Net(S,3); % the first property of the node
Node(5,1) = Net(S,4); % the second property of the node

% Start Node
Route = Node;%��㣨������+4��������

% Destination Node
Destination = zeros(5,1);%�յ㣨������+4��������
Destination(1,1) = D;
Destination(2,1) = Net(D,1);
Destination(3,1) = Net(D,2);
Destination(4,1) = Net(D,3);
Destination(5,1) = Net(D,4);

while 1
    % find direction: reture 1~4 represents one of four directions
    direction = FindDirection(Node(1,1),D);%���������յ��ж���������
    % find next node: return node ID
    if flag == 1
        Node(1,1) = NextNode_2(Node(1,1),D,area,energy_level,energy_cost);%�ҵ���һ����
        %         Node(1,1) = NextNode(Node(1,1),D,direction,area,energy_level,energy_cost);%�ҵ���һ����
    else if flag == 0
            Node(1,1) = NextNodeNon_2(Node(1,1),D,area,energy_level,energy_cost);
        else if flag == 2
                Node(1,1) = NextNode(Node(1,1),D,direction,area,energy_level,energy_cost);
            end
        end
    end
    if Node(1,1) == -1
        % if return -1, do not find a available node
        disp('Disable to arrive!');
        break;
    else
        % input the information of the return node from Net
        Node(2,1) = Net(Node(1,1),1);%��һ�����Ϊ���
        Node(3,1) = Net(Node(1,1),2);
        Node(4,1) = Net(Node(1,1),3);
        Node(5,1) = Net(Node(1,1),4);
        % add this node to final Route
        Route = [Route,Node];%�������ӵ�·���㵱��
        % avoid loop
        c = size(Route,2);%����������ĸ���
        c = c-1;
        i = 1;
        while i <= c%��һ�����൱�������һ��ɾ��ѭ���Ĳ�����ѭ�����level����Ϊ-1��
            if Route(1,c+1) == Route(1,i)
                loop_point = num2str(Route(1,i));
%             	Route(1,i);
                Net(Route(1,i+1),3) = -1;
                save('Net.mat','Net');
                Route_copy = zeros(5,i);
                for j = 1:i
                    for k = 1:5
                        Route_copy(k,j) = Route(k,j);
                    end
                end
                Route = zeros(5,i);
                for j = 1:i
                    for k = 1:5
                        Route(k,j) = Route_copy(k,j);
                    end
                end
                break;
            end
            i = i+1;
        end
    end
    if Node(1,1) == Destination(1,1)
        % if reach the destination, finish!
        break;
    end
    n_hops = n_hops + 1;
end

% % Route
links = int2str(links);
string = ['save(''Route_',links,'.mat'',''Route'');'];
eval(string);

for i = 1:a%���·�ߵ���ٽ����縴ԭ
    for j = 1:b
        Net(i,j) = Net_copy(i,j);
    end
end
save('Net.mat','Net');