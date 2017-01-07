clear all
close all

syms x y

f1 = 4*x^2 - y^3 + 28 ;
f2 = 3*x^3 + 4*y^2 - 145;

J = [diff(f1,x),diff(f1,y);diff(f2,x),diff(f2,y)];
JI=inv(J);

prev_solution = [1,1];
next_solution = [0,0];
eps=1;
 while abs(eps) > 0.1
    
    x1=subs(f1,{x,y},prev_solution);
    x2=subs(f2,{x,y},prev_solution);
    jacob=subs(JI,{x,y},prev_solution);
    next_solution = prev_solution' - jacob*[x1;x2];
    double(next_solution')
    eps = min(next_solution - prev_solution');
    prev_solution = next_solution';
    
 end