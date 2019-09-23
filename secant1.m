%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Steven Glasford
% Febuary 1, 2018
% Plot the Secant Formula 

% No inputs

% No Outputs. Plots are automatically generated
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Constants
function secant()
secant_func = @(x) x*(1+.25*sec((30/2)*sqrt(x/150000)));
fplot(secant_func);

fplot(secant_func,[2210 2220])
x_min = 2201;
x_max = 2249;
[bi_root,bi_func_val,bi_error_approx,bi_num_iterations] = bisection(...
    secant_func,x_min,x_max)
[falseroot,falsefunc_val,falseerror_approx,falsenum_iterations] = ...
    false_position(secant_func,x_min,x_max)

end