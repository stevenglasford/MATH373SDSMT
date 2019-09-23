function [root,func_val,error_approx,num_iterations] =...
    bisection (func,x_min,x_max,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Angel Nunez
% September 13, 2017 
% Bisection 

% Finds the roots of equations using the bisection method on the
% interval [x_min, x_max] looking for any sign changes and roots. Ouputs
% the root, function value, approximate error, and the number of
% iterations.
% 
% Inputs: 
% func - function of interest
% x_min - lower x bound of interval 
% x_max - upper x bound of interval 
% error_desired - desired error from approximation 
% max_iterations - maximum number of iterations
%
% Outputs: 
% root - the root of the function 
% func_val - the value of the function at the root 
% error_approx - approximate relative error
% num_iterations - number of iterations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f1=@(x) x+1
% >> [root,func_val,error_approx,num_iterations] =...
%    bisection (f1,-2,4)
% root = 
%   -1.0000
% func_val = 
%   -2.3842e-07
% error_approx = 
%   7.1526e-05
% num_iterations = 
%   23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Checks for the minimum number of imput arguments 
    if (nargin <3)
       error('At least three arguments are required')
    end

% Checks to see if there is a sign change beyween the interval
% [x_min,x_max]
sign_change_test = func(x_min)*func(x_max);

% ends the program if there is no sign change between the interval
if sign_change_test > 0
    error ('no sign change')
end 

% Sets the error_desired to default (0.0001)
if ((nargin < 4) || isempty (error_desired))
      error_desired =  0.0001; 
end 
          
% Sets the max_iterations to default (50) 
if ((nargin<5)|| isempty (max_iterations))
        max_iterations = 50; 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bisection 
% Initialize values
num_iterations = 0; 
xr=x_min; 
error_approx = 100; 

% Sets up a while loop that ends when the approximate error is more then 
% the desiered error and the number of iterations is greater then the 
% maximum number of iterations 
    while (error_approx > error_desired) && (num_iterations...
            < max_iterations)
        % Established the midpoint of the interval 
        root_old = xr; 
        xr = (x_min+x_max)/2;
        % counts the number of iterations occuring 
        num_iterations = num_iterations+1; 
        % Computes approximate error
        if xr ~= 0 
            error_approx = (abs((xr-root_old)/xr)*100); 
        end 
        
        % Checks for a sign change between bounds and possible root. 
        % Establishs new interval and possible root 
        sign_change_test = func(x_min)*func(xr);
        if sign_change_test < 0
            x_max=xr; 
        elseif sign_change_test > 0
            x_min = xr; 
        else
            error_approx = 0;  
        end 
        
        % stops loop if the approximate error is greater then your 
        % desired error or if the number of iterations excedes you 
        % max number of interations 
        if error_approx <= error_desired || num_iterations >= ...
        max_iterations
        break
        end
    end 
        % uses root to compute func_val 
        root = xr; func_val = func(root);
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Steven Glasford
% % Febuary 1, 2018
% % implement bisection 

% % inputs:  func, x_min, x_max, error_desired, max_iterations

% % outputs: root, func_val, error_approx, num_iterations
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function [root,func_val,error_approx,num_iterations] = bisection(func,...
    % x_min,x_max,error_desired,max_iterations)

% %check inputs and assign defaults

% %Requires more than 3 entries for the function to work
% if (nargin < 3)
    % error('At least three arguments are required');
% end

% if ((nargin < 4) || isempty(error_desired))
    % error_desired = .0001;
% end

% if ((nargin < 5) || isempty(max_iterations))
    % max_iterations = 50;
% end

% error_approx=100;
% x_bar_old=x_min;
% x_bar_new=x_min;
% num_iterations=0;

% while (error_desired<error_approx && num_iterations < max_iterations)
    
    % x_bar_old=(x_min + x_max)/2;
    % test = func(x_min)*func(x_bar_old);
    
    % if (test < 0)
        % x_max = x_bar_old;
           
    % elseif (test > 0)
        % x_min = x_bar_old;
        
    % else
        % root = x_bar_old;
        % error_approx = 0;
        % break
    % end
    
    % x_bar_new = (x_max + x_min)/2;
    
    % if (x_bar_new ~= 0)
            % error_approx = abs((x_bar_new - x_bar_old)/x_bar_new)*100;
    % end 
    % num_iterations = num_iterations + 1;
% end

% func_val = func(x_bar_new);
% root = x_bar_new;

% end