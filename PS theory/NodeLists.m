function flag_list = NodeLists(S,aim_start,aim_end,aim_y1,aim_y2)%获取区域除起点外的所有的点；先遍历左边缘的点，然后往右遍历

load Net;

NodeList = zeros(5,1);
Node = zeros(5,1);

flag = 0;
size_Net2 = size(Net,2);
flag_list = 1;
size_Net = size(Net,1);
flag_2 = 0;

for i = 1:size_Net
    if i ~= S
        if Net(i,2) >= aim_y1 && Net(i,2) <= aim_y2 && Net(i,1) >= aim_start && Net(i,1) <= aim_end
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
        if Net(i,2) >= aim_y1 && Net(i,2) <= aim_y2 && Net(i,1) >= aim_start && Net(i,1) <= aim_end
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
    
if NodeList(1,1) == 0
    flag_list = -1;
%     disp('no connected point!');
end

% find and input the first available node
% while 1
%     while Net(i,2) >= aim_y1 && Net(i,2) <= aim_y2
%         if i ~= S
%             for j = 5:size_Net2
%                 if Net(S,j) ~= 0
%                     for k = 5:size_Net2
%                         if Net(S,j) == Net(i,k)
%                             NodeList(1,1) = i;
%                             NodeList(2,1) = Net(i,1);
%                             NodeList(3,1) = Net(i,2);
%                             NodeList(4,1) = Net(i,3);
%                             NodeList(5,1) = Net(i,4);
%                             flag = i+1;
%                             i = i+1;
%                             break;
%                         end
%                     end
%                     if flag ~= 0
%                         break;
%                     end
%                 end
%             end
%             if flag ~= 0
%                 break;
%             end
%         end
%         i = i+1;
%         if i <= size_Net &&  Net(i,1) > aim_end
%             break;
%         end
%     end
%     i = i+1;
%     if i <= size_Net &&  Net(i,1) > aim_end
%         break;
%     end
%     if NodeList(1,1) ~= 0
%         break;
%     end
%     if i > size_Net
%         break;
%     end
% end
% 
% while i <= size_Net && Net(i,1) <= aim_end
%     if Net(i,2) >= aim_y1 && Net(i,2) <= aim_y2
%         if i ~= S
%             for j = 5:size_Net2
%                 flag3=0;
%                 if Net(S,j) ~= 0
%                     for k = 5:size_Net2
%                         if Net(S,j) == Net(i,k)
%                             Node(1,1) = i;
%                             Node(2,1) = Net(i,1);
%                             Node(3,1) = Net(i,2);
%                             Node(4,1) = Net(i,3);
%                             Node(5,1) = Net(i,4);
%                             NodeList = [NodeList,Node];
%                             flag3=1;
%                             break;
%                         end
%                     end
%                 end
%                 if flag3 == 1
%                     break;
%                 end
%             end
%         end
%     end
%     i = i+1;
%     if i > size_Net
%         break;
%     end
% end
% 
% if NodeList(1,1) == 0
%     flag_list = -1;
% end

% NodeList


save('NodeList.mat','NodeList');