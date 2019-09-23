function [x_root,func_val,error_approx,num_iterations] = secant(func,x_guess_one,x_guess_two,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Angel Nunez
% September 27, 2017 
% Secant Root Finding Method
% 
% Finds the roots of equations by creating a secant line and retains the
% efficiency of the Newton-Raphson method without having to compute the
% derivative
% 
% Inputs: 
% func - function of interest
% x_guess_one - first user guess to the root
% x_guess_two - second user guess to the root
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
    while((error_approx > error_desired) && (num_iterations <...
            max_iterations)) 
   
        % Establishes an x_guess based on the user's two guess points
        x_guess = x_guess_two - ((func(x_guess_two)*(x_guess_one-...
            x_guess_two))/(func(x_guess_one)-func(x_guess_two))); 
   
        % Updates the parameters x_guess_one and x_guess_two
        x_guess_one = x_guess_two; 
        x_guess_two = x_guess; 
    
        % Updates the number of iterations of the loop
        num_iterations = num_iterations + 1; 
        % Calculates the approximate error 
        error_approx = abs((x_guess-x_guess_one)/x_guess)*100; 
   
        %Terminates the while loop if conditions are not met 
        if error_approx <= error_desired || num_iterations >= ...
                max_iterations
            break
        end 
    end 
    % Uses root to compute func_val 
    x_root = x_guess; func_val = func(x_root); 
end 
    
    

