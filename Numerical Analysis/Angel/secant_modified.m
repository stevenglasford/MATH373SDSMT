function [x_root,func_val,error_approx,num_iterations] = ...
    secant_modified(func,x_guess,delta,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Angel Nunez
% September 27, 2017 
% Modified Secant Root Finding Method
% 
% Finds the roots of equations by using the secant method and one point and
% delta(a super small value)instead of two points
% 
% Inputs: 
% func - function of interest
% x_guess - user guess to the root
% delta - a small perturbation fraction
% error_desired - desired error from approximation 
% max_iterations - maximum number of iterations
%
% Outputs: 
% x_root - the root of the function 
% func_val - the value of the function at the root 
% error_approx - approximate relative error
% num_iterations - number of iterations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% >> y = @(x) x^2-4; 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    secant_modified(y,10)
% x_root = 
%   2.0000
% func_val = 
%   2.6645e-14
% error_approx = 
%   1.2912e-08
% num_iterations = 
%   7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Outputs an error if the minimum number of input arguments are not met
if nargin < 2 
    error ('At least two inputs arguments are required.') 
end 
% Sets delta to its default (0.0001) 
if nargin < 3 || isempty (delta)
    delta = 0.0001; 
end
% Sets the error desired to its default (0.0001)
if nargin < 4 || isempty (error_desired)
    error_desired = 0.0001; 
end
% Sets the maximum number of iterations to its default (50)
if nargin < 5 || isempty (max_iterations)
    max_iterations = 50; 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initializes the values of num_iterations and error_approx
num_iterations = 0;
error_approx = 100;

% Sets up a while loop that ends when the approximate error is more then 
% the desiered error and the number of iterations is greater then the 
% maximum number of iterations allowed 
    while((error_approx > error_desired) && (num_iterations <...
            max_iterations))

        % Backs up the user's x_guess
        x_guess_old = x_guess; 
        
        % x_guess is established using the formula 
        x_guess = x_guess - (((delta*func(x_guess))/(func(x_guess+delta)...
        -func(x_guess)))); 

        % Updates the number of iterations of the loop
        num_iterations = num_iterations+1; 
        % Calculates the approximate error 
        error_approx = abs((x_guess-x_guess_old)/x_guess)*100; 
    
        %Terminates the while loop is conditions are not met 
        if error_approx <= error_desired || num_iterations >=...
                max_iterations
            break
        end 
    end 
    % Uses root to compute func_val 
    x_root = x_guess; func_val = func(x_root); 
end
    



