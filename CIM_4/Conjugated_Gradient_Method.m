function [ coordinate,energy ] = Conjugated_Gradient_Method( n,coordinate,sigma,epsilon )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    h=1;
    distance=Get_Distance(n,coordinate);
    grad=-Grad(coordinate,distance,sigma,epsilon,n);
    r_0=grad;
    disp(grad);
    grad_max=10;
    for i=1:10
        [h,f]=fminsearch('stepsize',h);
        coordinate=coordinate+h.*grad;
        distance=Get_Distance(n,coordinate);
        r_1=-Grad(coordinate,distance,sigma,epsilon,n);
        beta=(sum(sum(r_1.^2)))/(sum(sum(r_0.^2)));
        grad=r_0+beta*r_1;
        grad_max=norm(max(abs(grad)));
        energy=f;
        disp(h);
    end
end

