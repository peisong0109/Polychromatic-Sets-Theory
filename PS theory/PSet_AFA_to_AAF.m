function PSet_AFA_to_AAF = PSet_AFA_to_AAF(Element_Group,Property_Group,name_AFA,name_AAF)

% load name_AFA_Element
string = ['load ',name_AFA,'_Element;'];
eval(string);

string = ['AAF_E_number = size(',name_AFA,'_Element,2);'];%n+1个，选择的点+补充的一个
eval(string);

% load name_AFA_Set
string = ['load ',name_AFA,'_Set;'];
eval(string);

% Get the number of Element in each Element Group
EGroup_Number = Element_Group.number;%所有节点分为两组
EGroup = zeros(1,EGroup_Number);%1行2列
for i=1:EGroup_Number
    EGroup(1,i) = 1;
end
for i=1:EGroup_Number%1行2列，第1列存的是区域内所有点的个数，第2列存的是多加的那个点
    j = num2str(i);
    string = ['EGroup(1,i) = size(Element_Group.Group',j,',2);'];
    eval(string);
end

% Get the number of Porperty in each Property Group
PGroup_Number = Property_Group.number;%特征组也分为2组
PGroup = zeros(1,PGroup_Number);%1行2列的特征组
for i=1:PGroup_Number
    PGroup(1,i) = 1;
end
for i=1:PGroup_Number%1行2列，第1列存的是第一特征组的列数，第2列存的是第二特征组的列数
    j = num2str(i);
    string = ['PGroup(1,i) = size(Property_Group.Group',j,',2);'];
    eval(string);
end

% Create the largest array
PNum_AAF = 1;
for i = 1:EGroup_Number
    PNum_AAF = PNum_AAF * EGroup(1,i);%1*n*1
end
for i = 1:PGroup_Number
    PNum_AAF = PNum_AAF * PGroup(1,i);%（1*n*1）*2（3）*2（3）
end
AAF_Set = zeros(AAF_E_number,PNum_AAF);%n+1行，（1*n*1）*2（3）*2（3）列
for i = 1:AAF_E_number%AAF_Set矩阵全赋为-1
    for j = 1:PNum_AAF
        AAF_Set(i,j) = -1;
    end
end
AAF_P = zeros(PGroup_Number,PNum_AAF);%2行，
for i = 1:PGroup_Number%AAF_P矩阵全赋为-1
    for j = 1:PNum_AAF
        AAF_P(i,j) = -1;
    end
end


% AxA(F)
flag = zeros(1,PGroup_Number);
for i = 1:PGroup_Number
    flag(1,i) = 1;
    i_str = num2str(i);
    string = ['Set_',i_str,' = zeros(1,AAF_E_number);']; % [1*n]，建立2个 1行n+1列 的矩阵Set_1，Set_2
    eval(string);
    for j = 1:AAF_E_number%矩阵全给-1
        string = ['Set_',i_str,'(1,j) = -1;'];
        eval(string);
    end
end
Set_and = zeros(1,AAF_E_number);%1行n+1列
for j = 1:AAF_E_number
    Set_and(1,j) = -1;
end

% flag to count the Property Number
AAF_P_number = 0;

while flag(1,1) <= PGroup(1,1)%flag(1,1) <= 第一特征组的列数，1<=2（3），特殊时为1
    
    % Property And()
    
    for i_set = 1:AAF_E_number
        string = ['Set_and(1,i_set) = ',name_AFA,'_Set(i_set,Property_Group.Group1(flag(1,1)));'];%将Property_Group.Group1的2或者3（就是特征组的第一个值）赋给Set_and（1行n+1列）
        eval(string);
    end
    
    if PGroup_Number > 1
        for j_set = 2:PGroup_Number
            j_set_str = num2str(j_set);%j_set_str=2
            
            for i_set = 1:AAF_E_number
                string = ['Set_',j_set_str,'(1,i_set) = ',name_AFA,'_Set(i_set,Property_Group.Group',j_set_str,'(flag(1,j_set)));'];%将Property_Group.Group2的5赋给Set_2（1行n+1列）
                eval(string);
            end
            
            string = ['Set_and = Set_and & Set_',j_set_str,';'];%两个矩阵进行&的操作，结果为0 1矩阵
            eval(string);
        end
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Element And() and Print
    
    flag_e = zeros(1,EGroup_Number);
    for i_e = 1:EGroup_Number
        flag_e(1,i_e) = 1;%1行2列 全给1
    end
    E_and = -1;
    
    while flag_e(1,1) <= EGroup(1,1)
        
        E_and = Set_and(1,Element_Group.Group1(flag_e(1,1)));
        
        if EGroup_Number > 1
            if E_and == 1
                for j_e = 2:EGroup_Number
                    j_e_str = num2str(j_e);
                    string = ['E_other = Set_and(1,Element_Group.Group',j_e_str,'(flag_e(1,j_e)));'];%E_other = 1
                    eval(string);
                    if (E_and == 1) && (E_other == 1)
                        E_and = 1;
                    else
                        E_and = 0;
                    end
                end
            end
        end%E_and == 1
        
        if E_and == 1
            AAF_P_number = AAF_P_number +1;
            
            for i_aaf = 1:AAF_E_number% 1：n+1
                AAF_Set(i_aaf,AAF_P_number) = 0;%n+1行，（1*n*1）*2（3）*2（3）列
            end
            for i_aaf = 1:EGroup_Number
                i_aaf_str = num2str(i_aaf);
                string = ['AAF_Set(Element_Group.Group',i_aaf_str,'(1,flag_e(1,i_aaf)),AAF_P_number) = 1;'];
                eval(string);
            end
            
            for j_aaf = 1:PGroup_Number
                AAF_P(j_aaf,AAF_P_number) = 0;
            end
            for j_aaf = 1:PGroup_Number
                j_aaf_str = num2str(j_aaf);
                string = ['AAF_P(j_aaf,AAF_P_number) = Property_Group.Group',j_aaf_str,'(1,flag(1,j_aaf));'];
                eval(string);
            end
            
        end
            
        
        % Flag_e
        for i_flag_e = EGroup_Number:-1:1
            if (flag_e(1,i_flag_e) == EGroup(1,i_flag_e)) && (i_flag_e ~= 1)
                flag_e(1,i_flag_e) = 1;
            else
                flag_e(1,i_flag_e) = flag_e(1,i_flag_e) + 1;
                break
            end
        end
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    % Flag
    for i_flag = PGroup_Number:-1:1
        if (flag(1,i_flag) == PGroup(1,i_flag)) && (i_flag ~= 1)
            flag(1,i_flag) = 1;
        else
            flag(1,i_flag) = flag(1,i_flag) + 1;
            break
        end
    end

end


% Formatted
string = [name_AAF,'_Set = zeros(AAF_E_number,AAF_P_number);'];
eval(string);
for i = 1:AAF_E_number
    for j = 1:AAF_P_number
        string = [name_AAF,'_Set(i,j) = -1;'];
        eval(string);
    end
end
for i = 1:AAF_E_number
    for j = 1:AAF_P_number
        string = [name_AAF,'_Set(i,j) = AAF_Set(i,j);'];
        eval(string);
    end
end

string = [name_AAF,'_Property = zeros(PGroup_Number,AAF_P_number);'];
eval(string);
for i = 1:PGroup_Number
    for j = 1:AAF_P_number
        string = [name_AAF,'_Property(i,j) = -1;'];
        eval(string);
    end
end
for i = 1:PGroup_Number
    for j = 1:AAF_P_number
        string = [name_AAF,'_Property(i,j) = AAF_P(i,j);'];
        eval(string);
    end
end

% save name_AAF_Set, name_AAF_P and name_AAF_E
string = ['save(''',name_AAF,'_Set.mat'',''',name_AAF, '_Set'');'];
eval(string);
string = ['save(''',name_AAF,'_Property.mat'',''',name_AAF, '_Property'');'];
eval(string);

string = [name_AAF,'_Element = ',name_AFA,'_Element;'];
eval(string);
string = ['save(''',name_AAF,'_Element.mat'',''',name_AAF, '_Element'');'];
eval(string);