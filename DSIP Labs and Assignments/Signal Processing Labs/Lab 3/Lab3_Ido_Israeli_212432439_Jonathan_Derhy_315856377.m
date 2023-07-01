%% Q1
clc; close all; clear;

n = 0:9;
xn = ((0.5).^n)+((-1/3).^n);
b = [2,-1/6];
a = [1,-1/6, -1/6]; 
N=9;
x = filter(b, a, [1, zeros(1, N)]);
delta = abs(xn-x);

figure('Name', 'Question 1', 'NumberTitle', 'off');
subplot(3, 1, 1);
stem(n, xn);
ylabel('x[n]');

subplot(3, 1, 2);
stem(n, x);
ylabel('x');

subplot(3, 1, 3);
stem(n, abs(xn-x));
ylabel('abs(x[n]-x)');

%% Q2
n=0:9;

h_n=-(1/4).^n+2.*(1/2).^n;
figure('Name', 'Question 2', 'NumberTitle', 'off');
subplot(3, 1, 1);
stem(n, h_n);
ylabel('h[n]');

b=1;
a=[1 -3/4 1/8];
y=filter(b,a,[1,zeros(1,9)]);
subplot(3, 1, 2);
stem(n, y);
ylabel('h[n] with filter');

subplot(3, 1, 3);
stem(n, abs(h_n-y));
ylabel('abs(h[n]-y)');

%% Q3
n=0:9;

h_n = -4.*((1/3).^n);
h_n(1) = h_n(1) + 6;

figure('Name', 'Question 3', 'NumberTitle', 'off');
subplot(3, 1, 1);
stem(n, h_n);
ylabel('h[n]');

b = [2 -2];
a = [1 -1/3];
y=filter(b,a,[1,zeros(1,9)]);
subplot(3, 1, 2);
stem(n, y);
ylabel('h[n] with filter');

subplot(3, 1, 3);
stem(n, abs(h_n-y));
ylabel('abs(h[n]-y)');

%% Q4
b = [1 0 0 0 0 0 0 0 0 0 -1/1024];
a = [1 -1/2];

figure('Name', 'Question 4', 'NumberTitle', 'off');
subplot(1,2,1);
zplane(b, a);
subplot(1,2,2);
impz(b, a);

%% Q5
n=0:9;
b=[1 0 -1];
a=[1 0.9 0.6 0.05];
for_Q5_and_Q6(5, n, b, a);

%% Q6
n=0:9;
b=[1 1/4 -1/8];
a=[1 1];
for_Q5_and_Q6(6, n, b, a);

%% Function for Q5 and Q6
function [] = for_Q5_and_Q6(questionNumber, n, b, a)
    figure('Name', "Question "+questionNumber+".1", 'NumberTitle', 'off');
    zplane(b,a);
    title('Using zplane');
    
    figure('Name', "Question "+questionNumber+".2", 'NumberTitle', 'off');
    h_n1=filter(b, a, [1,zeros(1,9)]);
    subplot(3,1,1);
    stem(n, h_n1);
    title('h[n] using filter');
    
    h_n2=impz(b, a, n).';
    subplot(3,1,2);
    stem(n, h_n2);
    title('h[n] using impz');
    
    delta_hn1_hn2 = abs(h_n1 - h_n2);
    subplot(3,1,3);
    stem(n, delta_hn1_hn2);
    title('The Difference Between h[n] using filter and h[n] using impz');
    
    figure('Name', "Question "+questionNumber+".3", 'NumberTitle', 'off');
    [r, p, k]=residuez(b, a);
    if numel(r) == 3 && numel(p) == 3
        h_n3 = r(1).*(p(1).^n) + r(2).*(p(2).^n) + r(3).*(p(3).^n);
    else
        if numel(r) == 2 && numel(p) == 2
            h_n3 = r(1).*(p(1).^n) + r(2).*(p(2).^n);
        else
            if numel(r) == 1 && numel(p) == 1 && numel(k) == 2
                h_n3 = r(1).*(p(1).^n);
                h_n3(1) = h_n3(1) + k(1);
                h_n3(2) = h_n3(2) + k(2);
            end
        end
    end
    subplot(3,1,1);
    stem(n, h_n3);
    title('h[n] using residuez');
    
    delta_hn1_hn3 = abs(h_n1 - h_n3);
    subplot(3,1,2);
    stem(n, delta_hn1_hn3);
    title('The Difference Between h[n] using filter and h[n] using residuez');
    
    delta_hn2_hn3 = abs(h_n2 - h_n3);
    subplot(3,1,3);
    stem(n, delta_hn2_hn3);
    title('The Difference Between h[n] using impz and h[n] using residuez');
end





