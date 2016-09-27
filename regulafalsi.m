%REGULAFALSI Summary of this function goes here
%Author: RAVI KUMAR THAKUR
%Detailed explanation goes here
clc;
f=inline('x^2-3');
format short
for n=0:3
if f(n)<0
a=n; %Calculates the the values of a and b
else %such that both the values are of opposite sign
b=n;
end
end
i=sprintf('a = %d\t\tf(a) = %d',a,f(a));
j=sprintf('b = %d\t\tf(b) = %d',b,f(b));
disp(i);
disp(j);
iteration=0;
r=0;
while abs(f(r))>0.001
r=((a*f(b))-(b*f(a)))/(f(b)-f(a));
if f(r)<0 %roots between r and b
a=r;
else
b=r; %roots between r and a
end
%e=abs(b-a);
disp(sprintf('\t%f\t\t%f\t\t%f\t\t%f',a,b,f(a),f(b)));
iteration=iteration+1;
end
disp(sprintf('\n\nThe approximate root of the equation is = %f',r))
disp(sprintf('Total number of iterations = %d',iteration));