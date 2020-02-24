function [ y,D ] = Lennard_Jones_Potential_With_Grad...
    ( coordinate,distance,sigma,epsilon,n )
y = 0;
D = zeros(n,3);
for i=1:n
    for j=i+1:n
        a=(sigma./distance(i,j)).^12 ;
        b=(sigma./distance(i,j)).^6;
        y = y + a - b;
        for k=1:3
            D(i,k)=D(i,k)+(b-2*a)*(coordinate(i,k)-coordinate(j,k))...
                /(distance(i,j).^2);
            D(j,k)=D(j,k)-D(i,k);
        end
    end
    y = y *4*epsilon;
    D = 24 * epsilon * D;
end
end


