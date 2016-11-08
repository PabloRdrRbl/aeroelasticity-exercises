%% Exercise instructions
%
% In "data.dat" you will dind measurements and the corresponding time step.
%
% 1. Read the data into Matlab and plot it.
% 2. Make a least squares fit to the funtion f = ax + b.
% 3. For the obtained parameters a and b plor the linear funtion in the
%    same figure.
% 4. Repeat task 1 to 3, but only take the masurements from t<=25.
% 5. The time steps (in seconds) are not given at equally spaced instances
%    (delta(t) is not constant).
%    Interpolate the measurement values such that delta(t)=1s.
%


%% Exercise 1

% Data loading
data = load('data.dat');

% Data formating
x = data(:, 1);
y = data(:, 2);

% Plotting
figure

scatter(x,y);

hold on
grid on

xlabel('time')
ylabel('some random magnitude')
legend('some radom data')


%% Exercise 2

% Curve fitting
% y= a*x + b

f = fit(x, y,'poly1');  % poly1 is a linear plynomial curve
a = f.p1;
b = f.p2;

%% Exercise  3

plot(x, a*x + b);
legend('some radom data', 'least squares fitting')


%% Exercise 4

% Data formating
mask = x <= 25;

xx = x(mask);
yy = y(mask);

% Curve fitting
% y= a*x + b

ff = fit(xx, yy,'poly1');  % poly1 is a linear plynomial curve
aa = ff.p1;
bb = ff.p2;

% Plotting
figure

hold on
grid on

scatter(xx, yy);
plot(xx, aa*xx + bb);

xlabel('time')
ylabel('some random magnitude')
legend('reduced data', 'least squares fitting')


%% Exercise 5

x_interp = linspace(1, 31, 50);

y_interp1 = interp1(x, y, x_interp, 'linear');  
y_interp2 = interp1(x, y, x_interp, 'spline');



% Plotting
figure

hold on
grid on

plot(x_interp, y_interp1);
plot(x_interp, y_interp2);
scatter(x, y);

xlabel('time')
ylabel('some random magnitude')
legend('linear', 'spline', 'data')


