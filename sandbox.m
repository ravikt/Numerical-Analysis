clear all
close all

x=1:50;
noise=4*rand(1,50);
m=2;
c=5;
y=m*x+c;
y=noise+y;
plot(x,y,'*')
X=ones(50,2);
X(:,2)=x;
y=y';
a=inv(X'*X)*X'*y
y1 = a(2)*x+a(1);
% y2 = 3*x + 10;
hold on
plot(x,y1)
% hold on
% plot(x,y2)