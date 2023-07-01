function [y,w] = my_dtft(x,n0)

w = linspace(-pi,pi,1024)

len1 = length(w);
len2 = length(x);

y=zeros(1,len1);

for m=1:1:len1
    for n=1:1:len2
        y(m)=y(m)+x(n)*exp(-1i*w(m)*(n0+n-1));
    end
end



    
