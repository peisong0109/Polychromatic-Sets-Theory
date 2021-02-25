function flag_list = NodeLists_2(S,D,area,angle_all)

load Net;

NodeList = zeros(5,1);
Node = zeros(5,1);

flag_list = 1;
% i = node_start;
size_Net = size(Net,1);
size_Net2 = size(Net,2);
flag = 0;
flag_2 = 0;
% S = 89;
% D = 165;
% area = 10;
% angle_all = 90;
for i = 1:size_Net
    if i ~= S
        if calculate_distance(Net(S,1),Net(S,2),Net(i,1),Net(i,2)) <= area
            if calculate_angle(Net(D,1),Net(D,2),Net(S,1),Net(S,2),Net(i,1),Net(i,2)) <= angle_all/2
                for j = 5:size_Net2
                    if Net(S,j) ~= 0
                        for k = 5:size_Net2
                            if Net(S,j) == Net(i,k)
                                NodeList(1,1) = i;
                                NodeList(2,1) = Net(i,1);%先找出第一个点赋值给NodeList
                                NodeList(3,1) = Net(i,2);
                                NodeList(4,1) = Net(i,3);
                                NodeList(5,1) = Net(i,4);
                                flag = i+1;
                                break;
                            end
                        end
                        if flag ~= 0
                            break;
                        end
                    end
                end
            end
        end
    end
    if flag ~= 0
        break;
    end
end
% NodeList

if flag == 0
    flag_2 = 1;
else
    flag_2 = flag;
end

for i = flag_2:size_Net
    if i ~= S
        if calculate_distance(Net(S,1),Net(S,2),Net(i,1),Net(i,2)) <= area
            if calculate_angle(Net(D,1),Net(D,2),Net(S,1),Net(S,2),Net(i,1),Net(i,2)) <= angle_all/2
                for j = 5:size_Net2
                    flag3=0;
                    if Net(S,j) ~= 0
                        for k = 5:size_Net2
                            if Net(S,j) == Net(i,k)
                                Node(1,1) = i;
                                Node(2,1) = Net(i,1);
                                Node(3,1) = Net(i,2);
                                Node(4,1) = Net(i,3);
                                Node(5,1) = Net(i,4);
                                NodeList = [NodeList,Node];
                                flag3=1;
                                break;
                            end
                        end
                    end
                    if flag3 == 1
                        break;
                    end
                end
            end
        end
    end
end
    
if NodeList(1,1) == 0
    flag_list = -1;
%     disp('no connected point!');
end
% NodeList

save('NodeList.mat','NodeList');