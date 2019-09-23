function integral = quad_step(func,x_min,x_max,tolerance)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% March 11, 2018 
% quad_step 

% Find the area under a curve using Adaptive Quadrature recursively. This
% program is a "controller program" for the function quad_adapt. quad_adapt
% is recursively called whenever the computer decides that it should
% increase the "resolution" of the number of slices used to find the area
% under a curve. 
% 
% Inputs: 
% func - input function
% x_min - lower x bound of interval 
% x_max - upper x bound of interval 
% tolerance - the tolerance to determine whether a need for recursion in
% the the function exists
%
% Outputs: 
% integral - the area under the line 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% >> integral = quad_step(f1,0,1)
% integral =
%     1.5000
% >> integral = quad_step(f1,0,1,[])
% integral =
%     1.5000

% f2=@(x) x^2+sin(x)
% >> integral = quad_step(f2,0,1,[])
% integral =
%     0.7930
% >> integral = quad_step(f2,0,1)
% integral =
%     0.7930

% f3=@(x) x^sin(x^2)
% >> integral = quad_step(f3,0,1)
% integral =
%     0.8994
% >> integral = quad_step(f3,0,1,[])
% integral =
%     0.8994

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %usage statement
    if nargin < 3
        error(['At least three arguments are required';
            'USAGE quad_step.m: integral = quad_step(func,x_min,x_max',...
            ',tolerance)'])
    end
    
    %set default value for tolerance
    if nargin < 4 || isempty(tolerance)
        tolerance = 10^(-6);
    end
    
    %call the function quad_adapt for the first time, then it will probably
    %call the function multiple times recursively
    integral = quad_adapt(func,x_min,x_max,tolerance);

end