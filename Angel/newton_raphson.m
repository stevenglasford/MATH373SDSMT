function [x_root,func_val,error_approx,num_iterations] = ...
    newton_raphson(func,dfunc,x_guess,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Angel Nunez
% September 27, 2017 
% Newton Raphson Root Finding Method
% 
% Finds the roots of equations by creating a tangent line extending from 
% the point given by the user and using where the tangent line crosses the
% x axis as a root estimate. 
% 
% Inputs: 
% func - function of interest
% dfunc - derivative of the function of interest 
% x_guess - user guess to the root
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
% >> dy = @ (x) 2*x; 
% >> [x_root, func_val, error_approx, num_iterations] = ...
%    newton_raphson(y, dy, 10)
% x_root = 
%   2
% func_val = 
%   0
% error_approx = 
%   1.0745e-09
% num_iterations = 
%   7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Outputs an error if the minimum number of input arguments are not met
if nargin < 3
    error ('At least three inputs are reuired.')
end
% Sets the error_desired to its default (0.0001) 
if nargin < 4 || isempty (error_desired)
    error_desired=0.0001; 
end
% Sets the max_iterations to its default (50)
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
    while ((error_approx > error_desired) && (num_iterations < ...
            max_iterations))
        % Backs up the user's x_guess
        x_guess_old = x_guess; 
        % Updates the number of iterations in the loop 
        num_iterations = num_iterations+1; 
        
        % x_guess is established using the formula 
        if (dfunc(x_guess) ~= 0)
            x_guess = x_guess - func(x_guess)/dfunc(x_guess); 
        % Outputs an error message if the derivative is 0 at the user's
        % x_guess and asks the user for a new guess 
        else 
            error (['Division by derivative of 0 at' num2str(x_guess)'.'...
            ' Please try a new guess.'])
        end
        
        % Calculates the approximate error 
        if x_guess ~= 0
            error_approx = abs((x_guess-x_guess_old)/x_guess)*100; 
        end
        % Terminates the while loop if the conditions are not met
        if error_approx <= error_desired || num_iterations >= ...
                max_iterations
            break
        end 
    end 
    % Uses root to compute func_val 
    x_root = x_guess; func_val = func(x_root); 
end