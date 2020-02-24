%CIM_3_1:P Matrix Method
clear;
conc=load('CIM-3p-concentration.txt','conc');
absorb=load('CIM-3p-Absorbance.txt','absorb');
unknown=load('CIM-3p-unknown.txt','unknown');
Y=absorb(:,2:17)';
%--------------------P Matrix: n=16,m=3,p=10,ns=4------------------------%
X=conc';
P=(Y'*Y)\Y'*X;
Y_predict=unknown(:,2:5)';
X_predict=Y_predict*P;
disp('Predicted Concentration');
disp(X_predict);
X_ref=load('CIM-3p-ref.txt','X-ref');
recovery=X_predict./X_ref;
disp('Recovery');
disp(recovery);