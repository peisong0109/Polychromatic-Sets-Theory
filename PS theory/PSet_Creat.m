function PSet_Creat = PSet_Creat(m,n,name)

% Creat name_Element
string = [name,'_Element=zeros(1,n);'];
eval(string);

for i = 1:n
    string = [name,'_Element(1,i) = i;'];
    eval(string);
end

% Save name_E
string = ['save(''',name,'_Element.mat'',''',name, '_Element'');'];
eval(string);


% Creat name_P
string = [name,'_Property=zeros(1,m);'];
eval(string);

for i = 1:m
    string = [name,'_Property(1,i) = i;'];
    eval(string);
end

% Save name_P
string = ['save(''',name,'_Property.mat'',''',name, '_Property'');'];
eval(string);


% Creat name_Set
string = [name,'_Set=zeros(n,m);'];
eval(string);

for i = 1:n
    for j = 1:m
        string = [name,'_Set(i,j) = -1;'];
        eval(string);
    end
end

% Save name_Set
string = ['save(''',name,'_Set.mat'',''',name, '_Set'');'];
eval(string);