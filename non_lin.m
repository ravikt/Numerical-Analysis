clear all;
close all;

L    = 5;
Lack = 2;
N=10;
b0=0.00018;
m=2;
n=2;

% Initial solution


syms a  b  t

p = 1-(1-t)^(N-1);
x = a+(1-a)*b;
y = p*(1-x^(m+1));

f1 = ((p*(1-a)*(1-b)*(L + Lack*(1-p)*N*t)) / (1-(1-t)^N)) - a; 
f2 = ((p + N*t*(1-p)) / (2-(1-t)^N + N*t*(1-p))) - b;
f3 = (((1 - x^(m+1))*(1 - y^(n+1))*b0) / ((1-x)*(1-y))) - t;

% Calculation of jacobian

 J = [diff(f1,a),diff(f1,b),diff(f1,t);diff(f2,a),diff(f2,b),diff(f2,t);...
    diff(f3,a),diff(f3,b),diff(f3,t)];
 JI = inv(J);
% 
prev_sol = [0.1,0.1,0.1];
next_sol = [0,0,0];
eps=1;
k= 1;
% 
while abs(eps) > 0.00001
   k
   x1 = subs(f1,{a,b,t},prev_sol);
   x2 = subs(f2,{a,b,t},prev_sol);
   x3 = subs(f3,{a,b,t},prev_sol);
   jacob = subs(JI,{a,b,t},prev_sol); 
   next_sol = prev_sol' - jacob*[x1;x2;x3];
   double(next_sol')
   eps = min(next_sol - prev_sol');
   check=double(abs(eps))
   prev_sol = next_sol';
   k=k+1;
end