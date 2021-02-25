%�µ�ѡ������ķ���
function node = NextNode_2(S,D,area,energy_level_original,energy_cost)

energy_level = energy_level_original + energy_cost; %4+3=7

value_node = Dir90Node(S,D,area,4,7,energy_level,0); % Traversal segments in 90��
if value_node == -1%�����[3,4],[5,6]���������û�к��ʵĵ㣬����������[2,3,4],[5,6,7]������
    value_node = Dir180Node(S,D,area,4,7,energy_level,0); % Traversal segments in 180��
    if value_node == -1
        value_node = Dir270Node(S,D,area,4,7,energy_level,0); % Traversal segments in 270��
        if value_node == -1
            value_node = Dir90Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0); %Lower the requirement and Traversal second-priority segments
            if value_node == -1
                value_node = Dir180Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                if value_node == -1
                    value_node = Dir270Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                end
            end
        end
    end
end

node = value_node;