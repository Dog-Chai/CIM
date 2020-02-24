function [y] = Lennard_Jones_Potential( distance,sigma,epsilon,n ) 
% Calculate the energy of a specific configuration
% coordinate saves the position information and epsilon and sigma are 
% parameters in the function, and n is the total number of atoms
% dist is a n*n matrix saving the distance between atoms.
y = 0;
for i=1:n-1
    for j=i+1:n
        y = y + (sigma./distance(i,j)).^12 - (sigma./distance(i,j)).^6;
    end
end
y = y *4*epsilon;
end

