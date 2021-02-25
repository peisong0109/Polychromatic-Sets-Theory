function node = NextNode(S,D,Dir,area,energy_level_original,energy_cost)

energy_level = energy_level_original + energy_cost;%4+3=7

if Dir == 1
    % 111-111 Dir 1
    % energy_level 3,4 
    value_node = Dir1Node(S,D,area,4,7,energy_level,0);
    if value_node == -1%�����[3,4],[5,6]���������û�к��ʵĵ㣬����������[2,3,4],[5,6,7]������
        % energy_level 2
        value_node = Dir1Node(S,D,area,4,6,energy_level,0);
        if value_node == -1%�������������û�к��ʵĵ㣬��ʼ����һ������ȥѰ��
            % neighbour 2/4
            neighbour = GetNextDirection(S,D,Dir);%����ǰ������û����Ҫ�ĵ�ʱ��ת��һ�����򣬾���������ת�����ݵ�ǰ��ƫ���ж�
            if neighbour == 2
                % neighbour 2
                % neighbour 2 energy_level 3,4
                value_node = Dir2Node(S,D,area,4,7,energy_level,0);
                if value_node == -1
                    % neighbour 2 energy_level 2
                    value_node = Dir2Node(S,D,area,4,6,energy_level,0);
                    if value_node == -1
                        % neighbour 4 energy_level 3,4
                        value_node = Dir4Node(S,D,area,4,7,energy_level,0);
                        if value_node == -1
                            % neighbour 4 energy_level 2
                            value_node = Dir4Node(S,D,area,4,6,energy_level,0);
                        end
                    end
                end
            else
                if neighbour == 4
                    % neighbour 4
                    % neighbour 4 energy_level 3,4
                    value_node = Dir4Node(S,D,area,4,7,energy_level,0);
                    if value_node == -1
                        % neighbour 4 energy_level 2
                        value_node = Dir4Node(S,D,area,4,6,energy_level,0);
                        if value_node == -1
                            % neighbour 2 energy_level 3,4
                            value_node = Dir2Node(S,D,area,4,7,energy_level,0);
                            if value_node == -1
                                % neighbour 2 energy_level 2
                                value_node = Dir2Node(S,D,area,4,6,energy_level,0);
                            end
                        end
                    end
                end
            end%���ˣ������ת�������Ѱ����һ����
            if value_node == -1%���ת������󣬻���û���ҵ����ʵĵ㣬�͵���������Χ������ԭ������Ѱ�ң������û�У����ٴ�ת��������
                % energy_level 1
                value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                if value_node == -1
                    if neighbour == 2
                        % neighbour 2
                        % neighbour 2 energy_level 1
                        value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 4 energy_level 1
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        end
                    else
                        if neighbour == 4
                            % neighbour 4
                            % neighbour 4 energy_level 1
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 2 energy_level 1
                                value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            end
                        end
                    end
                end
                % neighbour 3
                % the route to come back is ingored now, as it may result a loop
                % it may be discussed in theory but programming later
            end
        end
    end
else
    if Dir == 2
        % 222-222 Dir 2
        % energy_level 3,4
        value_node = Dir2Node(S,D,area,4,7,energy_level,0);
        if value_node == -1
            % energy_level 2
            value_node = Dir2Node(S,D,area,4,6,energy_level,0);
            if value_node == -1
                % neighbour 1/3
                neighbour = GetNextDirection(S,D,Dir);
                if neighbour == 1
                    % neighbour 1
                    % neighbour 1 energy_level 3,4
                    value_node = Dir1Node(S,D,area,4,7,energy_level,0);
                    if value_node == -1
                        % neighbour 1 energy_level 2
                        value_node = Dir1Node(S,D,area,4,6,energy_level,0);
                        if value_node == -1
                            % neighbour 3 energy_level 3,4
                            value_node = Dir3Node(S,D,area,4,7,energy_level,0);
                            if value_node == -1
                                % neighbour 3 energy_level 2
                                value_node = Dir3Node(S,D,area,4,6,energy_level,0);
                            end
                        end
                    end
                else
                    if neighbour == 3
                        % neighbour 3
                        % neighbour 3 energy_level 3,4
                        value_node = Dir3Node(S,D,area,4,7,energy_level,0);
                        if value_node == -1
                            % neighbour 3 energy_level 2
                            value_node = Dir3Node(S,D,area,4,6,energy_level,0);
                            if value_node == -1
                                % neighbour 1 energy_level 3,4
                                value_node = Dir1Node(S,D,area,4,7,energy_level,0);
                                if value_node == -1
                                    % neighbour 1 energy_level 2
                                    value_node = Dir1Node(S,D,area,4,6,energy_level,0);
                                end
                            end
                        end
                    end
                end
                if value_node == -1
                    % energy_level 1
                    value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                    if value_node == -1
                        if neighbour == 1
                            % neighbour 1
                            % neighbour 1 energy_level 1
                            value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 3 energy_level 1
                                value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            end
                        else
                            if neighbour == 3
                                % neighbour 3
                                % neighbour 3 energy_level 1
                                value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 1 energy_level 1
                                    value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                end
                            end
                        end
                    end
                    % neighbour 4
                    % the route to come back is ingored now, as it may result a loop
                    % it may be discussed in theory but programming later
                end
            end
        end
    else
        if Dir == 3
            % 333-333 Dir 3
            % energy_level 3,4
            value_node = Dir3Node(S,D,area,4,7,energy_level,0);
            if value_node == -1
                % energy_level 2
                value_node = Dir3Node(S,D,area,4,6,energy_level,0);
                if value_node == -1
                    % neighbour 2/4
                    neighbour = GetNextDirection(S,D,Dir);
                    if neighbour == 2
                        % neighbour 2
                        % neighbour 2 energy_level 3,4
                        value_node = Dir2Node(S,D,area,4,7,energy_level,0);
                        if value_node == -1
                            % neighbour 2 energy_level 2
                            value_node = Dir2Node(S,D,area,4,6,energy_level,0);
                            if value_node == -1
                                % neighbour 4 energy_level 3,4
                                value_node = Dir4Node(S,D,area,4,7,energy_level,0);
                                if value_node == -1
                                    % neighbour 4 energy_level 2
                                    value_node = Dir4Node(S,D,area,4,6,energy_level,0);
                                end
                            end
                        end
                    else
                        if neighbour == 4
                            % neighbour 4
                            % neighbour 4 energy_level 3,4
                            value_node = Dir4Node(S,D,area,4,7,energy_level,0);
                            if value_node == -1
                                % neighbour 4 energy_level 2
                                value_node = Dir4Node(S,D,area,4,6,energy_level,0);
                                if value_node == -1
                                    % neighbour 2 energy_level 3,4
                                    value_node = Dir2Node(S,D,area,4,7,energy_level,0);
                                    if value_node == -1
                                        % neighbour 2 energy_level 2
                                        value_node = Dir2Node(S,D,area,4,6,energy_level,0);
                                    end
                                end
                            end
                        end
                    end
                    if value_node == -1
                        % energy_level 1
                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            if neighbour == 2
                                % neighbour 2
                                % neighbour 2 energy_level 1
                                value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 4 energy_level 1
                                    value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                end
                            else
                                if neighbour == 4
                                    % neighbour 4
                                    % neighbour 4 energy_level 1
                                    value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    if value_node == -1
                                        % neighbour 2 energy_level 1
                                        value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    end
                                end
                            end
                        end
                        % neighbour 1
                        % the route to come back is ingored now, as it may result a loop
                        % it may be discussed in theory but programming later
                    end
                end
            end
        else
            if Dir == 4
                % 444-444 Dir 4
                % energy_level 3,4
                value_node = Dir4Node(S,D,area,4,7,energy_level,0);
                if value_node == -1
                    % energy_level 2
                    value_node = Dir4Node(S,D,area,4,6,energy_level,0);
                    if value_node == -1
                        % neighbour 1/3
                        neighbour = GetNextDirection(S,D,Dir);
                        if neighbour == 1
                            % neighbour 1
                            % neighbour 1 energy_level 3,4
                            value_node = Dir1Node(S,D,area,4,7,energy_level,0);
                            if value_node == -1
                                % neighbour 1 energy_level 2
                                value_node = Dir1Node(S,D,area,4,6,energy_level,0);
                                if value_node == -1
                                    % neighbour 3 energy_level 3,4
                                    value_node = Dir3Node(S,D,area,4,7,energy_level,0);
                                    if value_node == -1
                                        % neighbour 3 energy_level 2
                                        value_node = Dir3Node(S,D,area,4,6,energy_level,0);
                                    end
                                end
                            end
                        else
                            if neighbour == 3
                                % neighbour 3
                                % neighbour 3 energy_level 3,4
                                value_node = Dir3Node(S,D,area,4,7,energy_level,0);
                                if value_node == -1
                                    % neighbour 3 energy_level 2
                                    value_node = Dir3Node(S,D,area,4,6,energy_level,0);
                                    if value_node == -1
                                        % neighbour 1 energy_level 3,4
                                        value_node = Dir1Node(S,D,area,4,7,energy_level,0);
                                        if value_node == -1
                                            % neighbour 1 energy_level 2
                                            value_node = Dir1Node(S,D,area,4,6,energy_level,0);
                                        end
                                    end
                                end
                            end
                        end
                        if value_node == -1
                            % energy_level 1
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                if neighbour == 1
                                    % neighbour 1
                                    % neighbour 1 energy_level 1
                                    value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    if value_node == -1
                                        % neighbour 3 energy_level 1
                                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    end
                                else
                                    if neighbour == 3
                                        % neighbour 3
                                        % neighbour 3 energy_level 1
                                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                        if value_node == -1
                                            % neighbour 1 energy_level 1
                                            value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                        end
                                    end
                                end
                            end
                            % neighbour 2
                            % the route to come back is ingored now, as it may result a loop
                            % it may be discussed in theory but programming later
                        end
                    end
                end
            end
        end
    end
end

node = value_node;