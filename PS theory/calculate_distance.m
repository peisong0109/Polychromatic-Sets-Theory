%º∆À„æ‡¿Î
function distance = calculate_distance(x1,y1,x2,y2)
Y = [x1 y1;x2 y2];
distance = pdist(Y,'euclidean');