clearvars;
clc
close()
syms t
x0 = input('Nhap x0: ');
x = x0*cos(5*t);
x1 = x;
y0 = input('Nhap y0: ');
phi = input('Nhap phi: ');
y = y0*cos(5*t+phi);
y1 = y;
disp('Phuong trinh ban da nhap la: ');
fprintf('%si + %sj\n',x,y)
k = finverse(x);
syms x
k = subs(k,x);
y = subs(y,k);
disp('Phuong trinh chuyen dong la y(x): ');
fprintf('y(x) = %s\n',y);
hold on
ezplot(y)
ezplot(x1,y1,[0,pi/5])
grid on
hold off
