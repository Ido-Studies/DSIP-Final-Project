clc , clear;
%% Question 1
figure('Name','Question 1', 'NumberTitle', 'off');
limOfXAxis = [-3.5 3.5];

w = [-0.3*pi, -0.2*pi,0.2*pi,0.3*pi];
m = abs([(-4*pi*1i),(5*pi*sqrt(3)/2 + 1i*pi*5/2) ,(5*pi*sqrt(3)/2 - 1i*pi*5/2),(-4*pi*1i)]);
subplot(3,1,1);
stem(w,m);
title('Question 1.1');
xlim(limOfXAxis);
xlabel('w');
ylabel('Magnitude');

w = [-0.6*pi, -0.4*pi, 0.4*pi, 0.6*pi];
m = abs([(4*pi*1i),(5*pi*sqrt(3)/2 - 1i*pi*5/2) ,(5*pi*sqrt(3)/2 + 1i*pi*5/2),(-4*pi*1i)]);
subplot(3,1,2);
stem(w,m);
title('Question 1.2');
xlim(limOfXAxis);
xlabel('w');
ylabel('Magnitude');

w = linspace(-pi, pi, 100);
subplot(3,1,3);
stem(w,zeros(1,100));
title('Question 1.3');
xlim(limOfXAxis);
xlabel('w');
ylabel('Magnitude');
hold off;

%% Question 2
figure('Name','Question 2', 'NumberTitle', 'off');
subplot(3,2,1);
t = 0 : 0.01 : 5;
Xt = 2*cos(10*pi*t - pi/3) - 3*sin(16*pi*t);
plot(t,Xt);
title('Question 2.1');
xlabel('t');
hold on;
%n = t/0.5;
n = 0 : 0.05 : 5;
Xn = 2*cos(10*pi*n - pi/3) - 3*sin(16*pi*n);
stem(n,Xn);
xlim([0 5]);
legend({'X(t)','X[n]'},'Location','northeast');
hold off;

subplot(3,2,2);
plot(t,Xt);
hold on;
Yt = Xt;
plot(t,Yt);
title('Question 2.3');
legend({'X(t)','Y[t]'},'Location','northeast');
hold off;

subplot(3,2,3);
%n = t/0.1;
n = 0 : 0.1 : 5;
plot(t,Xt);
hold on;
Xn = 2*cos(10*pi*n - pi/3) - 3*sin(16*pi*n);
stem(n,Xn);
xlim([0 5]);
legend({'X[t]','X[n]'},'Location','northeast');
hold off;

subplot(3,2,4);
plot(t,Xt);
hold on;
Yt = cos(10*pi*t) + 3*sin(4*pi*t);
plot(t,Yt);
legend({'X(t)','Y[t]'},'Location','northeast');
hold off;

subplot(3,2,5);
%n = t/0.05;
n = 0 : 0.5 : 5;
plot(t,Xt);
hold on;
Xn = 2*cos(10*pi*n - pi/3) - 3*sin(16*pi*n);
stem(n,Xn);
xlim([0 5]);
legend({'X(t)','X[n]'},'Location','northeast');
hold off;

subplot(3,2,6);
plot(t,Xt);
hold on;
Yt = 2*cos(2*pi*t - pi/3);
plot(t,Yt);
legend({'X(t)','Y[t]'},'Location','northeast');
hold off;

%% Question 3
figure('Name','Question 3', 'NumberTitle', 'off');
t = linspace(-2,2,101);
Ts = 1/6;
Xt = 1 - 2*sin(pi*t) + cos(2*pi*t) + 3*cos(3*pi*t);

Xpt = forQuestion3(t, Ts, 5);
subplot(3,1,1);
plot(t,Xt);
hold on;
plot(t,Xpt);
hold off;
title('p = 5');
legend({'X(t)','Xp(t)'},'Location','northeast');

Xpt = forQuestion3(t, Ts, 10);
subplot(3,1,2);
plot(t,Xt); hold on;
plot(t,Xpt); hold off;
title('p = 10');
legend({'X(t)','Xp(t)'},'Location','northeast');

Xpt = forQuestion3(t, Ts, 20);
subplot(3,1,3);
plot(t,Xt);
hold on;
plot(t,Xpt);
hold off;
title('p = 20');
legend({'X(t)','Xp(t)'},'Location','northeast');

%% Question 4
figure('Name','Question 4', 'NumberTitle', 'off');
subplot(4,1,1);
t = 0 : 0.1 : 100;
Xt = cos(2*pi*0.025*t);
plot(t,Xt);

subplot(4,1,2);
Ts = 1 / 0.1;
nt = 0 : Ts : 100;
Xr = cos(2*pi*0.025*nt);
stairs(nt,Xr);hold on;
plot(nt,Xr);hold off;
title('fs = 0.1Hz');
legend({'ZOH','FOH'},'Location','northeast');

subplot(4,1,3);
Ts = 1 / 0.2;
nt = 0 : Ts : 100;
Xr = cos(2*pi*0.025*nt);
stairs(nt,Xr);
hold on;
plot(nt,Xr);
hold off;
title('fs = 0.2Hz');
legend({'ZOH','FOH'},'Location','northeast');

subplot(4,1,4);
Ts = 1 / 1;
nt = 0 : Ts : 100;
Xr = cos(2*pi*0.025*nt);
stairs(nt,Xr);
hold on;
plot(nt,Xr);
hold off;
title('fs = 1Hz');
legend({'ZOH','FOH'},'Location','northeast');

%% Functions

function [Xpt] = forQuestion3(t, Ts, p)
    Xpt = 0;
    for k = -p : p
        Xpt = Xpt + (1 - 2*sin(pi*k*Ts) + cos(2*pi*k*Ts) + 3*cos(3*pi*k*Ts))*(sinc((t-k*Ts)/Ts));
    end
end


