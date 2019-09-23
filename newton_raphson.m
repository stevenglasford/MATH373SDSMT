function [x_root,func_val,error_approx,num_iterations] = ...
    newton_raphson(func,dfunc,x_guess,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% Febuary 2, 2018 
% Newton Raphson Root Finding Method
% 
% Finds the roots of equations by creating a tangent line extending from 
% the point given by the user and using where the tangent line crosses the
% x axis as a root estimate. 
% 
% Inputs: 
% func - THE function
% dfunc - the derivative of THE function 
% x_guess - a guess for the root
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

% Outputs an error if there are less than 3 inputs
if nargin < 3
    error ('At least three inputs are reuired. (newton_raphson.m)')
end

% Sets the default for error_desired (0.0001) 
if nargin < 4 || isempty (error_desired)
    error_desired=0.0001; 
end

% Sets default for max_iterations (50)
if nargin < 5 || isempty (max_iterations)
    max_iterations = 50; 
end 

%initializes num_iterations and error_approx to their distinct functions
num_iterations = 0;
error_approx = 100;

%Set up a while loop that ends when max_iterations or the approximate 
%intial conditions are met
while ((error_approx > error_desired) && (num_iterations < ...
        max_iterations))
    
    % saves the guess for later use
    x_guess_old = x_guess; 
    
    % Updates the number of iterations in the loop 
    num_iterations = num_iterations + 1; 
    
    % x_guess can only be determined if derivative at x_guess is not zero 
    if (dfunc(x_guess) ~= 0)
        x_guess = x_guess - func(x_guess)/dfunc(x_guess); 
        % indicates an error if the derivative is zero at the x_guess 
    else
        error (['Division by derivative of 0 at' num2str(x_guess)'.'...
            ' Please try a new guess.'])
    end
    
    % Calculates the approximate error 
    if x_guess ~= 0
        error_approx = abs((x_guess-x_guess_old)/x_guess)*100; 
    end
    
    % Terminates the while loop if certain conditions are not met
    if error_approx <= error_desired || num_iterations >= ...
            max_iterations
        break
    end 
    
end

% the final x_guess is the x_root
x_root = x_guess;

%the value of the function at the point
func_val = func(x_root);
    
end