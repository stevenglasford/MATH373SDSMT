function [integral,error_approx,num_iterations] = romberg(func,x_min,...
    x_max,error_desired,max_iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% March 11, 2018 
% romberg 

% Find the area under a given function using a technique called Romberg
% integration in which one gets "garbage" and turns that into "gold" using 
% simple calculations
% 
% Inputs: 
% func - input function
% x_min - lower x bound of interval 
% x_max - upper x bound of interval 
% error_desired - the amount of error we wish to compute to,  lower
% absolute value means more iterations and computations, as well as a more
% accurate approximation
% max_iterations - the maximum number of iterations the program will be
% allowed to go through, as well as the size of the tableau
%
% Outputs: 
% integral - the area under the line 
% error_approx - the amount of error the computer calculated before ending
% the program.
% num_iterations - the number of iterations the computer used before ending
% the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f1=@(x) x+1
% >> [integral,error_approx,num_iterations] = romberg(f1,0,1)
% integral =
%     1.5000
% error_approx =
%      0
% num_iterations =
%      1
% >> [integral,error_approx,num_iterations] = romberg(f1,0,1,[],[])
% integral =
%     1.5000
% error_approx =
%      0
% num_iterations =
%      1

% f2=@(x) x^2+sin(x)
% >> [integral,error_approx,num_iterations] = romberg(f2,1,1,[],[])
% Error using trapezoid (line 87)
% Upper Bound must be greater than lower
% Error in romberg (line 61)
%     int_vals(1,1) = trapezoid(func,x_min,x_max,num_slices);
% >> [integral,error_approx,num_iterations] = romberg(f2,1,0,[],[])
% Error using trapezoid (line 87)
% Upper Bound must be greater than lower
% Error in romberg (line 61)
%     int_vals(1,1) = trapezoid(func,x_min,x_max,num_slices);
% >> [integral,error_approx,num_iterations] = romberg(f2,[],1,[],[])
% Subscripted assignment dimension mismatch.
% Error in romberg (line 61)
%     int_vals(1,1) = trapezoid(func,x_min,x_max,num_slices);
% >> [integral,error_approx,num_iterations] = romberg(f2,0,1,[],[])
% integral =
%     0.7930
% error_approx =
%    4.8396e-07
% num_iterations =
%      3
% >> [integral,error_approx,num_iterations] = romberg(f2,0,1,[])
% integral =
%     0.7930
% error_approx =
%    4.8396e-07
% num_iterations =
%      3
% >> [integral,error_approx,num_iterations] = romberg(f2,0,1)
% integral =
%     0.7930
% error_approx =
%    4.8396e-07
% num_iterations =
%      3


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %usage statement if there are not enough inputs
    if (nargin < 3)
        error(['Not enough inputs for romberg.m';'USAGE: [integral,',...
            'error_approx,num_iterations] = romberg(func,x_min,',...
            'x_max,error_desired,max_iterations)'])
    end
    
    %set the default error desired
    if ((nargin < 4) || isempty(error_desired))
        error_desired = .00001;
    end

    %set the default max_iterations to 50
    if ((nargin < 5) || isempty(max_iterations))
        max_iterations = 50;
    end
    
    %set initial values
    error_approx = 100;
    num_slices = 1;
    int_vals(1,1) = trapezoid(func,x_min,x_max,num_slices);
    num_iterations = 0;
    
    while (num_iterations < max_iterations)
       
       num_iterations = num_iterations + 1;
       
       num_slices = 2^num_iterations;
       
       %first test point
       int_vals(num_iterations + 1, 1) = trapezoid(func,x_min,x_max,...
           num_slices);
       
       %second test point
       for k = 2:(num_iterations + 1)
           j = 2 + num_iterations - k;
           int_vals(j,k) = (4^(k-1)*int_vals(j+1,k-1)-int_vals(j,k-1))...
               /(4^(k-1)-1);
           
       end
       
       %error calculation
       error_approx = abs((int_vals(1,num_iterations + 1) - ...
           int_vals(2,num_iterations))/(int_vals(1,num_iterations+1)))*100;
       
       %exit the loop if all of the conditions are correct to exit the loop
       if (error_approx <= error_desired)
           break
       end
       
    end
    
    integral = int_vals(1,num_iterations + 1);
    
end