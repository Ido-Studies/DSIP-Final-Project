%% Main
filename = 'djw6576.txt';
x = load(filename);
N = 600;
y1 = UsingMovingAvg(x, N, 0, 50);
y2 = UsingMovingAvg(x, N, -25, 25);

figure('Name', 'Question 1', 'NumberTitle', 'off');
hold on
plot(x)
plot(y1)
plot(y2)
legend({'x[n]', 'y1[n]', 'y2[n]'}, 'Location', 'southeast');
hold off

%%%%%%
figure('Name', 'Question 2', 'NumberTitle', 'off')
y3 = UsingFirstOrderExponential(x, N, 0.1);
subplot(2,2,1)
hold on
plot(x)
plot(y3)
legend({'x[n]', 'y[n]'}, 'Location', 'southwest');
title('First Order Exponential When lambda equals 0.1')
hold off

y3 = UsingFirstOrderExponential(x, N, 0.25);
subplot(2,2,2)
hold on
plot(x)
plot(y3)
legend({'x[n]', 'y[n]'}, 'Location', 'southwest');
title('First Order Exponential When lambda equals 0.25')
hold off

y3 = UsingFirstOrderExponential(x, N, 0.5);
subplot(2,2,3)
hold on
plot(x)
plot(y3)
legend({'x[n]', 'y[n]'}, 'Location', 'southwest');
title('First Order Exponential When lambda equals 0.5')
hold off

y3 = UsingFirstOrderExponential(x, N, 0.75);
subplot(2,2,4)
hold on
plot(x)
plot(y3)
legend({'x[n]', 'y[n]'}, 'Location', 'southwest');
title('First Order Exponential When lambda equals 0.75')
hold off

figure('Name', 'Question 3.1.1', 'NumberTitle', 'off');
x = [-1 0 1];
n0 = -1;
[y,w] = my_dtft(x,n0);
subplot(3,1,1)
plot(real(y))
legend('Re(y[n])');
subplot(3,1,2)
plot(angle(y))
legend('Angle(y[n])');
subplot(3,1,3)
plot(imag(y))
legend('Im(y[n])');

figure('Name', 'Question 3.1.2', 'NumberTitle', 'off');
x = [2 3 1 0 -1 -3 -2];
n0 = -3;
[y,w] = my_dtft(x,n0);
subplot(3,1,1)
plot(real(y))
legend('Re(y[n])');
subplot(3,1,2)
plot(angle(y))
legend('Angle(y[n])');
subplot(3,1,3)
plot(imag(y))
legend('Im(y[n])');

[y1,w1] = my_dtft([1],0);
[y2,w2] = my_dtft([1],1);
[y3,w3] = my_dtft([1],2);
[y4,w4] = my_dtft([1],-1);
[y5,w5] = my_dtft([1],-2);

figure('Name', 'Question 3.2 Abs', 'NumberTitle', 'off');
hold on
plot(abs(y1))
plot(abs(y2))
plot(abs(y3))
plot(abs(y4))
plot(abs(y5))
hold off
legend({'abs(y1[n])', 'abs(y2[n])', 'abs(y3[n])', 'abs(y4[n])', 'abs(y5[n])'});

figure('Name', 'Question 3.2 Wrapped Angle', 'NumberTitle', 'off');
hold on
plot(angle(y1))
plot(angle(y2))
plot(angle(y3))
plot(angle(y4))
plot(angle(y5))
hold off
legend({'angle(y1[n])', 'angle(y2[n])', 'angle(y3[n])', 'angle(y4[n])', 'angle(y5[n])'});

figure('Name', 'Question 3.2 Unwrapped Angle', 'NumberTitle', 'off');
hold on
plot(unwrap(angle(y1)))
plot(unwrap(angle(y2)))
plot(unwrap(angle(y3)))
plot(unwrap(angle(y4)))
plot(unwrap(angle(y5)))
hold off
legend({'unwrap(angle(y1[n]))', 'unwrap(angle(y2[n]))', 'unwrap(angle(y3[n]))', 'unwrap(angle(y4[n]))', 'unwrap(angle(y5[n]))'});

%% Functions
function [y] = UsingMovingAvg(x, N, init_k, fin_k)
    y=zeros(N, 1);
    for n=0:N-1
        sum = 0;
        for k = init_k:fin_k
            if ((n-k)>0) && ((n-k)<=(N-1))
                sum = sum + (1/51) * x(n-k);
            end
            y(n+1) = sum;
        end
    end
end

function [y] = UsingFirstOrderExponential(x, N, lambda)
    y=zeros(N, 1);
    y(1) = x(1);
    for n=1:N-1
        y(n+1) = lambda*x(n+1) + (1-lambda)*y(n);
    end
end
