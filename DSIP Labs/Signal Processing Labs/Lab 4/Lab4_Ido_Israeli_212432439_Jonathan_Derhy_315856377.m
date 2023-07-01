%% Q1
clc;
N = 128;
x_n = setSignalAsSumOfTwoTrigFun(N, 1, 'sin', 0.1992, 0.005, 'sin', 0.25);
omega = linspace(-pi, pi, N);

figure('Name', 'Question 1', 'NumberTitle', 'off');

magnitude = calcMagnitude(x_n, 1, 1);
subplot(2,1,1)
plot(omega, magnitude)
xlabel('\omega');
ylabel("|X(\omega)| in dB");

magnitude = calcMagnitude(x_n.*blackman(N)', 1, 1);
subplot(2,1,2)
plot(omega, magnitude)
xlabel('\omega');
ylabel("|X(\omega)| in dB");


%% Q2
clc;
N = 256;
x_n = setSignalAsSumOfTwoTrigFun(N, 1, 'cos', 0.25, 0.01, 'sin', 0.265);
omega = linspace(-pi, pi, N);

figure('Name', 'Question 2', 'NumberTitle', 'off');

magnitude = calcMagnitude(x_n, 1, 1);
subplot(3,1,1)
plot(omega, magnitude)
xlabel('\omega');
ylabel("|X(\omega)| in dB");

magnitude = calcMagnitude(x_n.*blackman(N)', 1, 1);
subplot(3,1,2)
plot(omega, magnitude)
xlabel('\omega');
ylabel("|X(\omega)| in dB");

N = 1024;
x_n = setSignalAsSumOfTwoTrigFun(N, 1, 'cos', 0.25, 0.01, 'sin', 0.265);
omega = linspace(-pi, pi, N);
magnitude = calcMagnitude(x_n.*blackman(N)', 1, 1);
subplot(3,1,3)
plot(omega, magnitude)
xlabel('\omega');
ylabel("|X(\omega)| in dB");


%% Q3
clc;

figure('Name', 'Question 3', 'NumberTitle', 'off');

subplot(2,1,1)
N = 2^12;
[x_n, n] = setSignalAsSumOfTwoTrigFun(N, 1, 'cos', 1/16, 0.75, 'cos', 1/8);
omega = 2*pi.*n/N;
x_n = padWithZeros(x_n, 64);
magnitude = calcMagnitude(x_n);
plot(omega, magnitude)
hold on
N = 64;
[x_n, n] = setSignalAsSumOfTwoTrigFun(N, 1, 'cos', 1/16, 0.75, 'cos', 1/8);
magnitude = calcMagnitude(x_n);
omega = 2*pi.*n/N;
stem(omega, magnitude(1:N))

xlabel('\omega');
ylabel("|X(\omega)|");

subplot(2,1,2)
newN = 256;
[x_n, n]= setSignalAsSumOfTwoTrigFun(newN, 1, 'cos', 1/16, 0.75, 'cos', 1/8);
omega = 2*pi.*n/newN;
x_n = padWithZeros(x_n, N);
magnitude = calcMagnitude(x_n);

plot(omega, magnitude)
hold on
omega = 2*pi.*n/newN;
stem(omega, magnitude)

xlabel('\omega');
ylabel("|X(\omega)|");


%% Functions
function [magnitude] = calcMagnitude(x_n, shift, inDecibels)
    X_omega = fft(x_n);
    if nargin >= 2 && shift
        X_omega = fftshift(X_omega);
    end
    magnitude = abs(X_omega);
    if nargin >= 3 && inDecibels
        magnitude = mag2db(magnitude);
    end
end

function [x_n, n] = setSignalAsSumOfTwoTrigFun(N, firstCoefficient, trigFunc1,  w0, secondCoefficient, trigFunc2, w1)
    n = 0:N-1;
    expression = [num2str(firstCoefficient) '*' trigFunc1 '(2*pi*w0*n) + ' num2str(secondCoefficient) '*' trigFunc2 '(2*pi*w1*n)'];
    x_n = eval(expression);
end

function [x_n] = padWithZeros(x_n, start)
    x_n(start:end) = 0;
end
