function [x_root,func_val,error_approx,num_iterations] = ...
    secant_modified(func,x_guess,delta,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% Febuary 15, 2018 
% Modified Secant Root Finding Method
% 
% Finds the roots of equations by using the secant method a point and a
% delta 
% 
% Inputs: 
% func - The function
% x_guess - something near the root
% delta - a small perturbation fraction
% error_desired - desired error 
% max_iterations - maximum number of iterations
%
% Outputs: 
% x_root - the root of the function 
% func_val - the value of the function at the root 
% error_approx - approximate relative error
% num_iterations - number of iterations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%There is an error if there are less than 2 inputs
if nargin < 2 
    error ('At least two inputs arguments are required. (Secant Modified)') 
end

% Sets the default delta to its default (0.0001) 
if nargin < 3 || isempty (delta)
    delta = 0.0001; 
end

% Sets the default error desired to its default (0.0001)
if nargin < 4 || isempty (error_desired)
    error_desired = 0.0001; 
end

% Sets the default maximum number of iterations to its default (50)
if nargin < 5 || isempty (max_iterations)
    max_iterations = 50; 
end

%set initial values
num_iterations = 0;
error_approx = 100;

while((error_approx > error_desired) && (num_iterations <...
            max_iterations))
        % sets the old value for later use
    x_old = x_guess;
        
        %find the new x_guess
    x_guess = x_guess - (((delta*func(x_guess))/(func(x_guess+delta)...
        -func(x_guess))));
    
    %update the num_intervals
    num_iterations = num_iterations + 1;
    
    % Calculates the approximate error only if the x_guess doesn't equal
    %zero
    if (x_guess ~= 0)
        error_approx = abs((x_guess-x_guess_old)/x_guess)*100;
    end
    
    %terminates the program if the conditions are not met
    if error_approx <= error_desired || num_iterations >=...
                max_iterations
            break
    end 
end
%sets the x_root
x_root = x_guess;

%calculates the actual value
func_val = func(x_root);
end