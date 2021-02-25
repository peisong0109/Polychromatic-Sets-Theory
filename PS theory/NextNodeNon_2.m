%新的选择区域的方法,对于传统的方法
function node = NextNodeNon_2(S,D,area,energy_level_original,energy_cost)

energy_level = energy_level_original + energy_cost;%4+3=7


value_node = Dir90Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
if value_node == -1
    value_node = Dir180Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
    if value_node == -1
        value_node = Dir270Node(S,D,area,[1,2,3,4],[5,6,7],energy_level,0);
    end
end


node = value_node;