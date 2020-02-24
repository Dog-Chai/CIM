function [ Distance ] = Get_Distance( n, coordinate )
% From atom coordinates to get the distance between atoms
Distance=zeros(n,n);
for i=1:n-1
    for j=i+1:n
        tmp=coordinate(i,:)-coordinate(j,:);
        Distance(i,j)=norm(tmp);
        Distance(j,i)=Distance(i,j);
    end
end


end

