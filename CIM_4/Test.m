global n coordinate distance
sigma=1;
epsilon=1;
n=2;
h=0.5;
coordinate=Random_Initialize(n,1.5);
    distance=Get_Distance(n,coordinate);
    grad=-Grad(coordinate,distance,sigma,epsilon,n);
    r_0=grad;
    counter = 0;
    grad_max=10;
    %------------------Conjugated Gradient Method--------------------%
    for i=1:20
       disp(Lennard_Jones_Potential(distance,1,1,n));
       counter = counter + 1;
       [h,f]=fminsearch('stepsize',h);
       disp(h);
        coordinate=coordinate+h*grad;
        distance=Get_Distance(n,coordinate);
       r_1=-Grad(coordinate,distance,sigma,epsilon,n);
       beta=(sum(sum(r_1.^2)))/(sum(sum(r_0.^2)));
       grad=r_0+beta*r_1;
       grad_max=norm(max(abs(grad)));
    end