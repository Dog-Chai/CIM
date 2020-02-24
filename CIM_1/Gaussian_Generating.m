function [ x,y ] = Gaussian_Generating( mu,hw,range )
% Generate Gaussian peak with parameter (miu,sigma),generate 'range' pair
% of points;
% This function doesn't generate Gaussian distribution.
% So I doesn't multiply normalization constant.
sigma=hw/(2*sqrt(2*log(2)));
x=0:1:range;
y=exp(-((x-mu).^2)/(2*(sigma.^2)));
end

