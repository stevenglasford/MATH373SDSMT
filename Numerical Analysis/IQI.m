function [x_root, func_val,error_approx,num_iterations] = IQI(func,...
    x_guess_one,x_guess_two,x_guess_three,error_desired,max_iterations)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% 2-25-2018 
% Inverse Quadratic Interpolation Method of Finding Roots
% 
% Finds the roots of equations by creating an inverse quadratic function 
% and then finding the root of that function this retains the
% efficiency of the Newton-Raphson method without having to compute the
% derivative, and increasing the overall efficiency by adding another term
% to the taylor series
% 
% Inputs: 
% func - THE function
% x_guess_one - first guess of the root
% x_guess_two - second guess of the root
% x_guess_three - third guess of the root
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
%    IQI(y,7,8,10)
% x_root = 
%   2.0000
% func_val = 
%   -8.8818e-16
% error_approx = 
%   3.7442e-08
% num_iterations = 
%   7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >> y = @(x) exp(-x)-x^3; 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    IQI(y,0,1.5,2)
% x_root = 
%   0.7729
% func_val = 
%   -2.7756e-16
% error_approx = 
%   1.6943e-08
% num_iterations = 
%   7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >> y = @(x) x-cos(x); 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    IQI(y,0,.5,1)
% x_root = 
%   0.7391
% func_val = 
%   2.2204e-16
% error_approx = 
%   1.2372e-10
% num_iterations = 
%   5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >> y = @(x) exp(x)-x^2+3*x-2; 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    IQI(y,.5,.4,.1)
% x_root = 
%   0.2575
% func_val = 
%   0
% error_approx = 
%   5.5218e-10
% num_iterations = 
%   4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >> y = @(x) 5*(sin(x)+cos(x))-x 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    IQI(y,0,2,4)
% x_root = 
%   2.0605
% func_val = 
%   4.4409e-16
% error_approx = 
%   2.2473e-09
% num_iterations = 
%   6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >> y = @(x) besselj; 
% >> [x_root,func_val,error_approx,num_iterations] = ...
%    IQI(y,3,2,1)
% x_root = 
%   2.4048
% func_val = 
%   0
% error_approx = 
%   1.8741e-08
% num_iterations = 
%   5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Checks for the minimum number of imput arguments 
    if (nargin < 4)
       error('At least four arguments are required')
    end

% Sets the error_desired to default (0.0001)
if ((nargin < 5) || isempty (error_desired))
      error_desired =  0.0001; 
end 
          
% Sets the max_iterations to default (50) 
if ((nargin < 6)|| isempty (max_iterations))
        max_iterations = 50; 
end 

%initialize all of the appropriate things
num_iterations = 0;
error_approx = error_desired + 1;
x_temp = x_guess_one;

%checks to see if any of the inputs have the same y values to begin with
    if ((func(x_guess_one) == func(x_guess_two)) || ...
            (func(x_guess_one) == func(x_guess_three)) || ...
            (func(x_guess_two) == func(x_guess_three)))
        error(['At least two of your initial guesses had the same '...
            'function values']);
    end


while ((num_iterations < max_iterations) && (error_approx > error_desired))
    
    %makes sure none of the inputs have the same y value each time the 
    %loop iterates
    if ((func(x_guess_one) == func(x_guess_two)) || ...
            (func(x_guess_one) == func(x_guess_three)) || ...
            (func(x_guess_two) == func(x_guess_three)))
        error(['Divide by zero error in the ' num_iterations 'th '...
            'iteration of IQI, either y_n == y_(n-1), or y_n == y_(n-2)'...
            ' or y_(n-2) == y_(n-1)']);
    end
    
    %calculate the new point
    x_temp = ((func(x_guess_two)*func(x_guess_one)) / ... 
        ((func(x_guess_three) - func(x_guess_two))*(func(x_guess_three)-...
        func(x_guess_one))))*x_guess_three + ((func(x_guess_three)*...
        func(x_guess_one))/((func(x_guess_two)-func(x_guess_three))*...
        (func(x_guess_two)-func(x_guess_one))))*x_guess_two +...
        ((func(x_guess_three)*func(x_guess_two))/((func(x_guess_one)-...
        func(x_guess_three))*(func(x_guess_one)-func(x_guess_two))))*...
        x_guess_one;
    
    
    %the first to be deleted is x_guess_three, followed by x_guess_two
    x_guess_three = x_guess_two;
    x_guess_two = x_guess_one;
    x_guess_one = x_temp;
    
    %error calculation can only occur when the x_guess_one isn't zero
    if (x_guess_one ~= 0)
        error_approx = abs((x_guess_two - x_guess_one) / x_guess_one)...
            * 100;
    end
    
    %increase num_iterations
    num_iterations = num_iterations + 1;
    
    % stops loop if the approximate error is greater then your 
    % desired error or if the number of iterations excedes you 
    % max number of interations 
    if (error_approx <= error_desired || num_iterations >= ...
        max_iterations)
        break
    end
    
end

%assigns the last x_guess value to be the root
x_root = x_guess_one;
%finds what the value of the function at the calculated root actually is
func_val = func(x_root);

end