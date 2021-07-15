function [lb, ub] = initial_guess()

indexing;
% lb: vector - lower bound of initial guess for each free parameter
% ub: vector - upper bound of initial guess for each free parameter

% in this case we have 8 free parameters, and we fit them in the log
% scale (base 10) in order to explore a large dynamic range

lb(1, 1) = log10(2);
ub(1, 1) = log10(30);

lb(2, 1) = log10(20);
ub(2, 1) = log10(90);

lb(3, 1) = log10(1e-6);
ub(3, 1) = log10(2);

lb(4, 1) = log10(1e-6);
ub(4, 1) = log10(6);

lb(5, 1) = log10(1e-6);
ub(5, 1) = log10(2);

lb(6, 1) = log10(1e-6);
ub(6, 1) = log10(2);

lb(7, 1) = log10(1);
ub(7, 1) = log10(50);

lb(8, 1) = log10(1e-6);
ub(8, 1) = log10(2);

end
