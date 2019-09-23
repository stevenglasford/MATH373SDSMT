function [x_root,func_val,error_approx,num_iterations] = ...
    secant(func,x_guess_one,x_guess_two,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% 2-15-2018 
% Secant Root Finding Method
% 
% Finds the roots of equations by creating a secant line and retains the
% efficiency of the Newton-Raphson method without having to compute the
% derivative
% 
% Inputs: 
% func - THE function
% x_guess_one - first guess of the root
% x_guess_two - second guess of the root
% error_desired - desired error from approximation 
% max_iterations - maximum number of iterations
%
% Outputs: 
% x_root - the function root
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

% Outputs an error if there are less than three inputs
if nargin < 3
    error ('At least three inputs are required (secant.m)')
end

% Sets the default error_desired (0.0001) 
if nargin < 4 || isempty (error_desired)
    error_desired=0.0001; 
end

% Sets the default max_iterations (50)
if nargin < 5 || isempty (max_iterations)
    max_iterations = 50; 
end 

% Initializes the num_iterations and error_approx
num_iterations = 0; 
error_approx = 100; 

%Set up a while loop that ends when max_iterations or the approximate 
%intial conditions are met
while((error_approx > error_desired) && (num_iterations <...
        max_iterations))
    
    %x_guess is the combo of x_guess_one and x_guess_two
    x_guess = x_guess_two - ((func(x_guess_two)*(x_guess_one-...
        x_guess_two))/(func(x_guess_one)-func(x_guess_two)));
    
    % Updates the parameters x_guess_one and x_guess_two
    x_guess_one = x_guess_two; 
    x_guess_two = x_guess;
    
    % Add to the number of iterations
    num_iterations = num_iterations + 1; 
    
    % Calculates the approximate error but only if the x_guess isn't
    %equal to zero
    if x_guess ~= 0
        error_approx = abs((x_guess-x_guess_one)/x_guess)*100;
    end
    
    %Terminates the while loop if conditions are not met 
    if error_approx <= error_desired || num_iterations >= ...
            max_iterations
        break
    end 
end

%find the root
x_root = x_guess;

%the value of the actual function at the root
func_val = func(x_root);

end