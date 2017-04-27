clear all
close all


sdpvar x1
sdpvar x2
sdpvar x3
sdpvar x4


constraints = [x1>=18, x2>=4, x3>=1, x4>=0.5, x1+x2+x3+x4<=24];
objective = x1+x2+x3+x4;

%Solver settings for using Sedumi
options = sdpsettings('solver','sedumi');
sol = optimize(constraints,objective,options);

if sol.problem == 0
 % Extract and display value
 solution = [value(x1), value(x2), value(x3), value(x4)]
 sol.info
else
 display('Solution not found');
 sol.info
 yalmiperror(sol.problem)
end