%LAGRANGE'S INTERPOLATION
%for unevenly spaced data sets
%Author: RAVI KUMAR THAKUR
clc;
syms x;
n=input('Enter the limit of data ');
%a=zeros(n,n+1);
ax=input('Enter the values of x ');
ay=input('Enter the values of y ');
w=1;
check=zeros(1,n);
for i=1:n
w=conv(w,[1 -ax(i)]);
end
for j=1:n
k=[1 -ax(j)];
m=subs(diff(poly2sym(w)),ax(j));
l=(poly2sym(w)/(poly2sym(k)*m))*ay(j);
n=k*m;
[q,r]=deconv(w,n);
c=q*ay(j);
check=check+c;
end
disp(check);
disp(sprintf('The interpolating polynomial is '));
disp(poly2sym(check));
xval=input('Enter the value of x ');
answer=subs(poly2sym(check),xval);
disp(answer);