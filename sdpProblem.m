%% Semidefinite Programming
clear all
close all;

Q = sdpvar(5,5); 

% known vectors x1, x2 and x3
% x1 = [0.4494; 0.1006; 0.8261]
% x2 = [0.5362; 0.8979; -0.1319]
% x3 = [-0.1472; 1.0078; -2.1237]

x1 = randn(5,1);
x2 = randn(5,1);
x3 = randn(5,1);
% gamma values

g1 = 3;
g2 = 2;
g3 = 1;


constraints = [Q>=0, x1'*Q*x1>=g1, x2'*Q*x2>=g2, x3'*Q*x3>=g3];
objective = trace(Q);

%Solver settings for using Seddumi
options = sdpsettings('solver','sedumi');
sol = optimize(constraints,objective,options);

% Errror handling
if sol.problem == 0
 % Extract and display value
 solution = value(Q)
 display('Eigenvalues');
 lambda = value(eig(Q))
 sol.info
else
 display('Solution not found');
 sol.info
 yalmiperror(sol.problem)
end