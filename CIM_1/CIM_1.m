clear;
hold off;
%-----------------------生成高斯峰信号并且作图------------------------%
[X,Y1]=Gaussian_Generating(120,70,511);
[X,Y2]=Gaussian_Generating(250,80,511);
[X,Y3]=Gaussian_Generating(380,90,511);
Y_1=2.*Y1+3.*Y2+4.*Y3;
plot(X,Y_1,'r');
legend('Gaussian peaks without noise')
hold on;
error=0.5*rand(1,512)-0.25;
Y=Y_1+error;
plot(X,Y);
legend('Gaussian peaks without noise', 'Gaussian peaks with noise')
title('Generated Signal of problem 1');
pause();
%-------------------------S-G Smoothing----------------------------%
m=40 ; n=2*m+1;                              %窗口长度为半峰宽
k=4;                                          %三次多项式拟合
SG_x(:,1)=ones(n,1); t=-m:m; t=t';
for j=1:k-1
    SG_x(:, j+1)=t.*SG_x(:,j);
end
B=SG_x*(inv(SG_x'*SG_x))*SG_x';           %计算平滑矩阵B
Y_new = zeros(1,512);
init_plot=Y(1,1:n);
init_smooth=B*init_plot';
Y_new(1:m)=init_smooth(1:m);              %计算初始的m个值
for i=m+1:512-m-2;
    init_plot=Y(1,i-m:i+m);
    init_smooth=B*init_plot';
    Y_new(i)=init_smooth(m+1);            %计算中间的信号值
end
init_plot=Y(1,512-n+1:512);
init_smooth=B*init_plot';
Y_new(512-m-1:512)=init_smooth(m:n);     %计算最后的m个值
plot(X,Y_new,'m');
legend('Gaussian peaks without noise', 'Gaussian peaks with noise','Signal after smoothing');
title('Smoothed Signal of problem 1');
hold off;
pause();
%后面的程序与前面的程序完全相同，半峰宽换成了30，故略去注释
clear;
[X,Y1]=Gaussian_Generating(120,28,511);
[X,Y2]=Gaussian_Generating(250,30,511);
[X,Y3]=Gaussian_Generating(380,32,511);
Y_1=2.*Y1+3.*Y2+4.*Y3;
plot(X,Y_1,'r');
legend('Gaussian peaks without noise')
hold on;
error=0.5*rand(1,512)-0.25;
Y=Y_1+error;
plot(X,Y);
legend('Gaussian peaks without noise', 'Gaussian peaks with noise')
title('Generated Signal of problem 2');
pause();
%-------------------------S-G Smoothing----------------------------%
m=15 ; n=2*m+1;
k=4;
SG_x(:,1)=ones(n,1); t=-m:m; t=t';
for j=1:k-1
    SG_x(:, j+1)=t.*SG_x(:,j);
end
B=SG_x*(inv(SG_x'*SG_x))*SG_x';     %Calculate Smoothing Matrix
Y_new = zeros(1,512);
init_plot=Y(1,1:n);
init_smooth=B*init_plot';
Y_new(1:15)=init_smooth(1:15);
for i=m+1:512-m-2;
    init_plot=Y(1,i-15:i+15);
    init_smooth=B*init_plot';
    Y_new(i)=init_smooth(m+1);
end
init_plot=Y(1,512-n+1:512);
init_smooth=B*init_plot';
Y_new(512-m-1:512)=init_smooth(m:n);
plot(X,Y_new,'m');
legend('Gaussian peaks without noise', 'Gaussian peaks with noise','Signal after smoothing');
title('Smoothed Signal of problem 2');
