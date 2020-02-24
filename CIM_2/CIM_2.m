load('data.mat');
Y=unnamed(:,6);
X=unnamed(:,1:5);
stepwise(X,Y)
