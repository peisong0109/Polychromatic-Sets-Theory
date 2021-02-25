function DrawNetWithProperty = DrawNetWithProperty(n,p_level)

load Net;
Count = zeros(1,p_level);%12个等级，存的是统计每个等级的数量

for i = 1:n
    switch Net(i,3)
        case 1
            switch Net(i,4)
                case 1
                    scatter(Net(i,1),Net(i,2),'g','*');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 2
                    scatter(Net(i,1),Net(i,2),'b','*');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 3
                    scatter(Net(i,1),Net(i,2),'r','*');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
            end
        case 2
            switch Net(i,4)
                case 1
                    scatter(Net(i,1),Net(i,2),'g','pentagram');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 2
                    scatter(Net(i,1),Net(i,2),'b','pentagram');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 3
                    scatter(Net(i,1),Net(i,2),'r','pentagram');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
            end
        case 3
            switch Net(i,4)
                case 1
                    scatter(Net(i,1),Net(i,2),'g');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 2
                    scatter(Net(i,1),Net(i,2),'b');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 3
                    scatter(Net(i,1),Net(i,2),'r');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
            end
        case 4
            switch Net(i,4)
                case 1
                    scatter(Net(i,1),Net(i,2),'r','square');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 2
                    scatter(Net(i,1),Net(i,2),'b','square');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
                case 3
                    scatter(Net(i,1),Net(i,2),'g','square');
%                     text(Net(i,1),Net(i,2),[num2str(i)]);
                    hold on;
            end
    end
end



for i = 1:n
    switch Net(i,3)
        case 1
            switch Net(i,4)
                case 1
                    Count(1,1) = Count(1,1) + 1;
                case 2
                    Count(1,2) = Count(1,2) + 1;
                case 3
                    Count(1,3) = Count(1,3) + 1;
                otherwise
                    Net(i,4)
            end
        case 2
            switch Net(i,4)
                case 1
                    Count(1,4) = Count(1,4) + 1;
                case 2
                    Count(1,5) = Count(1,5) + 1;
                case 3
                    Count(1,6) = Count(1,6) + 1;
                otherwise
                    Net(i,4)
            end
        case 3
            switch Net(i,4)
                case 1
                    Count(1,7) = Count(1,7) + 1;
                case 2
                    Count(1,8) = Count(1,8) + 1;
                case 3
                    Count(1,9) = Count(1,9) + 1;
                otherwise
                    Net(i,4)
            end
        case 4
            switch Net(i,4)
                case 1
                    Count(1,10) = Count(1,10) + 1;
                case 2
                    Count(1,11) = Count(1,11) + 1;
                case 3
                    Count(1,12) = Count(1,12) + 1;
                otherwise
                    Net(i,4)
            end
        otherwise
            Net(i,3)
    end
end





save('Count.mat','Count');