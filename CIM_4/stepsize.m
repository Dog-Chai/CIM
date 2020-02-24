function [ fh ] = stepsize( h )
%   finding h
%   Detailed explanation goes here
global coordinate distance n;

tmp = coordinate - h*Grad(coordinate,distance,1,1,n);
tmp_dist=Get_Distance(n,tmp);
fh=Lennard_Jones_Potential(tmp_dist,1,1,n);
%disp(fh);
%disp('****')

end

