% Linnear feasibility problem

sdpvar x1
sdpvar x2

constraints = [x1>=0, x2>=0, x1+x2>=1, x1+x2<=2, x1+2*x2>=2];
objective = 0;

%Solver settings for using Seddumi
options = sdpsettings('solver','sedumi');
sol = optimize(constraints,objective,options);

% Error handling
if sol.problem == 0
 % Extract and display value
 solution = [value(x1), value(x2)]
 sol.info
else
 display('Solution not found');
 sol.info
 yalmiperror(sol.problem)
end