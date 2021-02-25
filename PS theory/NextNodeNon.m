function node = NextNodeNon(S,D,Dir,area,energy_level_original,energy_cost)

energy_level = energy_level_original + energy_cost;

if Dir == 1
    % 111-111 Dir 1
    % energy_level 3,4
    value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
    if value_node == -1
        % energy_level 2
        value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
        if value_node == -1
            % neighbour 2/4
            neighbour = GetNextDirection(S,D,Dir);
            if neighbour == 2
                % neighbour 2
                % neighbour 2 energy_level 3,4
                value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                if value_node == -1
                    % neighbour 2 energy_level 2
                    value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                    if value_node == -1
                        % neighbour 4 energy_level 3,4
                        value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 4 energy_level 2
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        end
                    end
                end
            else
                if neighbour == 4
                    % neighbour 4
                    % neighbour 4 energy_level 3,4
                    value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                    if value_node == -1
                        % neighbour 4 energy_level 2
                        value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 2 energy_level 3,4
                            value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 2 energy_level 2
                                value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            end
                        end
                    end
                end
            end
            if value_node == -1
                % energy_level 1
                value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
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
        value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
        if value_node == -1
            % energy_level 2
            value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
            if value_node == -1
                % neighbour 1/3
                neighbour = GetNextDirection(S,D,Dir);
                if neighbour == 1
                    % neighbour 1
                    % neighbour 1 energy_level 3,4
                    value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                    if value_node == -1
                        % neighbour 1 energy_level 2
                        value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 3 energy_level 3,4
                            value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 3 energy_level 2
                                value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            end
                        end
                    end
                else
                    if neighbour == 3
                        % neighbour 3
                        % neighbour 3 energy_level 3,4
                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 3 energy_level 2
                            value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 1 energy_level 3,4
                                value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 1 energy_level 2
                                    value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                end
                            end
                        end
                    end
                end
                if value_node == -1
                    % energy_level 1
                    value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
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
            value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
            if value_node == -1
                % energy_level 2
                value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
                if value_node == -1
                    % neighbour 2/4
                    neighbour = GetNextDirection(S,D,Dir);
                    if neighbour == 2
                        % neighbour 2
                        % neighbour 2 energy_level 3,4
                        value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                        if value_node == -1
                            % neighbour 2 energy_level 2
                            value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 4 energy_level 3,4
                                value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 4 energy_level 2
                                    value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                end
                            end
                        end
                    else
                        if neighbour == 4
                            % neighbour 4
                            % neighbour 4 energy_level 3,4
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 4 energy_level 2
                                value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 2 energy_level 3,4
                                    value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    if value_node == -1
                                        % neighbour 2 energy_level 2
                                        value_node = Dir2Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    end
                                end
                            end
                        end
                    end
                    if value_node == -1
                        % energy_level 1
                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
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
                value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
                if value_node == -1
                    % energy_level 2
                    value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
                    if value_node == -1
                        % neighbour 1/3
                        neighbour = GetNextDirection(S,D,Dir);
                        if neighbour == 1
                            % neighbour 1
                            % neighbour 1 energy_level 3,4
                            value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                            if value_node == -1
                                % neighbour 1 energy_level 2
                                value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 3 energy_level 3,4
                                    value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    if value_node == -1
                                        % neighbour 3 energy_level 2
                                        value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    end
                                end
                            end
                        else
                            if neighbour == 3
                                % neighbour 3
                                % neighbour 3 energy_level 3,4
                                value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                if value_node == -1
                                    % neighbour 3 energy_level 2
                                    value_node = Dir3Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                    if value_node == -1
                                        % neighbour 1 energy_level 3,4
                                        value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                        if value_node == -1
                                            % neighbour 1 energy_level 2
                                            value_node = Dir1Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
                                        end
                                    end
                                end
                            end
                        end
                        if value_node == -1
                            % energy_level 1
                            value_node = Dir4Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,1);
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