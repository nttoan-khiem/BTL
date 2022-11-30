syms t
x = input('Nhap phuong trinh chuyen dong cua vat the theo x, x= ');
y = input('Nhap phuong trinh chuyen dong cua vat the theo y, y= ');
t0 = input('Nhap thoi diem vat bat dau chuyen dong t_0 = ');
t1 = input('Nhap thoi diem vat ket thuc chuyen dong t_1 = ');
x = sym(x);
y = sym(y);
ezplot(x,y,[t0,t1])
grid on;
speed_x = diff(x,t);
acceleration_x = diff(speed_x,t);
speed_y = diff(y,t);
acceleration_y = diff(speed_y,t);
t_a = input('Nhap thoi gian can tinh gia toc t = ');
a_x = subs(acceleration_x,t_a);
a_y = subs(acceleration_y,t_a);
moldum = sqrt(a_x^2+a_y^2);
disp('Ket qua !!');
fprintf('Gia toc theo truc x: %.4f (m/s^2)\n', a_x);
fprintf('Gia toc theo truc y: %.4f (m/s^2)\n', a_y);
fprintf('Do lon gia toc tai thoi diem %d (s) la: %.4f (m/s^2)\n', t_a, moldum);