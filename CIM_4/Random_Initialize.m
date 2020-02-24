function [ coordinate ] = Random_Initialize( n,ref_r )
%----------------------Initializing Positions---------------------------%
coordinate = eye(n,3);                %atom coordinate
r = ref_r*sqrt(n);% * rand(1);                     %radius of the initial sphere
theta = pi * rand(n,1);
phi = 2 * pi * rand(n,1);              %polar angles
coordinate(:,1) = r .* sin(theta) .* cos(phi);
coordinate(:,2) = r .* sin(theta) .* sin(phi);
coordinate(:,3) = r .* cos(theta);
%----------------------Initializing Finished----------------------------%


end

