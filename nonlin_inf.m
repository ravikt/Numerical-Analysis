clear all

fun=@nonlin;            
x0=[0.1,0.1,0.1];
x=fsolve(fun,x0)
