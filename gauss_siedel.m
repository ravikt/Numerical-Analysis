%GAUSS SEIDEL METHOD
%for solution of system of linear equations
%Author: RAVI KUMAR THAKUR
%The following program solves system
%of linear equations having n unknowns
%User inputs the coeeficient of unknowns
n=input('Enter the number of unknowns ');
a=zeros(n,n);
for i=1:n
a(i,:)=input(sprintf('Enter equation %d ',i));
end
%User inputs the corresponding coefficient
b=zeros(n,1);
b(:,1)=input('Enter the constants ');
%Implementing Gauss seidel Method
L=tril(a);
U=triu(a,1);
T=(-inv(L)*U);
C=(inv(L)*b);
%First approximation
%x=[1;1];
for k=1:n
x(k)=b(k)/a(k,k);
end
%Running iterations
it=1;
while abs(min((a*x)-b))>0.0001
disp(x');
x=(T*x)+C;
it=it+1;
end
disp(sprintf('The total number of iteration is %d',it));
disp('The solution matrix is ');
disp(x);
