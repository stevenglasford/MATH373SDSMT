%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% Febuary 1, 2018
% implement bisection 

% inputs:  func, x_min, x_max, error_desired, max_iterations

% outputs: root, func_val, error_approx, num_iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [root,func_val,error_approx,num_iterations] = bisection(func,x_min,x_max,error_desired,max_iterations)

%check inputs and assign defaults

%Requires more than 3 entries for the function to work
if (nargin < 3)
    error('At least three arguments are required');
end

if ((nargin < 4) || isempty(error_desired))
    error_desired = .0001;
end

if ((nargin < 5) || isempty(max_iterations))
    max_iterations = 50;
end

error_approx=100;
x_bar_old=x_min;
x_bar_new=x_min;
num_iterations=0;

while (error_desired<error_approx && num_iterations < max_iterations)
    
    x_bar_old=(x_min + x_max)/2;
    test = func(x_min)*func(x_bar_old);
    
    if (test < 0)
        x_max = x_bar_old;
           
    elseif (test > 0)
        x_min = x_bar_old;
        
    else
        root = x_bar_old;
        error_approx = 0;
        break
    end
    
    x_bar_new = (x_max + x_min)/2;
    
    if (x_bar_new ~= 0)
            error_approx = abs((x_bar_new - x_bar_old)/x_bar_new)*100;
    end 
    num_iterations = num_iterations + 1;
end

func_val = func(x_bar_new);
root = x_bar_new;

end