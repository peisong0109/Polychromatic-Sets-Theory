function node = FindBestNodes_2(Dir)

load FindBestNode;
load Net;
load TestBestNode;
num = size(FindBestNode,2);%FindBestNode 第1行存的是每个节点的

switch Dir
    case 1
        for i = 1:num
            no = FindBestNode(1,i);
            FindBestNode(2,i)=Net(no,1)+Net(no,2);%FindBestNode 第2行存 横纵坐标相加
        end
    case 2
        for i = 1:num
            no = FindBestNode(1,i);
            FindBestNode(2,i)=Net(no,1)-Net(no,2);
        end
    case 3
        for i = 1:num
            no = FindBestNode(1,i);
            FindBestNode(2,i)= 0 - Net(no,1) - Net(no,2);
        end
    case 4
        for i = 1:num
            no = FindBestNode(1,i);
            FindBestNode(2,i)=Net(no,2)-Net(no,1);
        end
    otherwise
        disp('Error Direction!');
end

while 1
    large_num = FindBestNode(1,1);
    large_data = FindBestNode(2,1);
    for i = 1:num
        if FindBestNode(2,i) > large_data
            large_data = FindBestNode(2,i);
            large_num = FindBestNode(1,i);
        end
    end%保存距离和方向最合适的那个点
    if large_num == TestBestNode
        for i = 1:num
            if FindBestNode(2,i) == large_data
                FindBestNode(2,i) = -1;
                FindBestNode(1,i) = -1;
            end
        end
    else
        break;
    end
end

node = large_num;