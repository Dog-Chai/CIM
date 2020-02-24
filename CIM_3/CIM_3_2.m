%CIM_3_2: K Matrix
conc=load('CIM-3k-concentration.txt','conc');
absorb=load('CIM-3k-Absorbance.txt','absorb');
unknown=load('CIM-3k-unknown.txt','unknown');
Y=absorb(:,2:10)';
%-----------------------K Matrix:n=9,p=8,ns=9,m=3------------------------%
K=conc\Y;
Y_predict=unknown(:,2:10)';
X_predict=Y_predict/K;
disp('Predicted Concentration');
disp(X_predict);
X_ref=load('CIM-3k-ref.txt','X_ref');
recovery=X_predict./X_ref;
disp('Recovery');
disp(recovery);