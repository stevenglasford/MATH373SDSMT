%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% Febuary 1, 2018
% false position implementation 

% inputs:  func, x_min, x_max, error_desired, max_iterations

% outputs: root, func_val, error_approx, num_iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [root,func_val,error_approx,num_iterations] = false_position(func,x_min,x_max,error_desired,max_iterations)

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
x_r_old=x_min;
x_r_new=x_min;
num_iterations=0;

while (error_desired<error_approx && num_iterations < max_iterations)
    
    x_r_old = x_max - (func(x_max) * (x_min - x_max))/(func(x_min) - ...
        func(x_max));
    
    test = func(x_min)*func(x_r_old);
    
    if (test < 0)
        x_max = x_r_old;
           
    elseif (test > 0)
        x_min = x_r_old;
        
    else
        root = x_r_old;
        error_approx = 0;
        break
    end
    
    x_r_new = x_max - (func(x_max) * (x_min - x_max))/(func(x_min) - ...
        func(x_max));
    
    if (x_r_new ~= 0)
            error_approx = abs((x_r_new - x_r_old)/x_r_new)*100;
    end 
    num_iterations = num_iterations + 1;
end

func_val = func(x_r_new);
root = x_r_new;

end