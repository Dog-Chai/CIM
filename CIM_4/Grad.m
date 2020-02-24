function [ D ] = Grad...
( coordinate,distance,sigma,epsilon,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
D = zeros(n,3);
for i=1:n
    for j=1:n
        if(j==i)
            continue;
        else
        m=(sigma./(distance(i,j))).^12 ;
        s=(sigma./(distance(i,j))).^6;
        for k=1:3
            D(i,k)=D(i,k)+(s-2*m)*(coordinate(i,k)-coordinate(j,k))...
                /(distance(i,j).^2);
            %D(j,k)=D(j,k)-(s-2*m)*(coordinate(i,k)-coordinate(j,k))...
            %    /(distance(i,j).^2);
        end
        end
    end
end
    D = 24 * epsilon * D;
end


