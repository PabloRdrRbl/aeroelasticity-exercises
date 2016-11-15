%addpath('AirfoilData');

k = 150000; % [Nm / 

data = load('ag8092nt_M02.dat');

alpha = data(:, 1);
cl = data(:, 2);
cd = data(:, 3);
cm = data(:, 4);

figure(1)

hold on

plot(data(:, 1), data(:, 2), 'LineWidth', 2);
plot(data(:, 1), data(:, 3), 'LineWidth', 2);
plot(data(:, 1), data(:, 4), 'LineWidth', 2);

grid on

title('Aerodynamic coefficients for the airfoil')
xlabel('Aerodynamics')
ylabel('some random magnitude')
legend('C_l', 'C_d', 'C_m')

% Linear behaviour between AoA -6 and 6.

mask1 = alpha >= -6;
mask2 = alpha <= 6;
mask = mask1 & mask2;

cl = cl(mask);
alpha = alpha(mask);
cd = cd(mask);
cm = cm(mask);

% Least squares

[m, n] = size(alpha);
x = [alpha ones(m, 1)];
y = cl;






