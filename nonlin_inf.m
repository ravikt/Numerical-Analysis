clear all

fun=@nonlin;            
x0=[0.01,0.01,0.01];
x=fsolve(fun,x0)
