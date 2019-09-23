function integral = gauss_quad(func,x_min,x_max,num_points)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% March 18, 2018 
% gauss_quad.m 

% Find the approximate area under a curve by using very simple calculations
% using multi-point gauss quadrature.
% 
% Inputs: 
% func - input function
% x_min - lower x bound of interval 
% x_max - upper x bound of interval 
% num_points - the number of points to use for the multipoint
% gauss-quadrature calculation

%
% Outputs: 
% integral - the approximate area under the line 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f1=@(x) x+1
% >> integral = gauss_quad(f1,0,1)
% integral = 
%     1.500
% >> integral = gauss_quad(f1,0,1,1)
% integral = 
%     1.500
% >> integral = gauss_quad(f1,0,1,6)
% Error using gauss_quad (line 133)
% You entered a number of points greater than 5, which is currently 
% unsupported in gauss_quad.m, please enter a value
% between 1 and 5 for the number of points
% >> integral = gauss_quad(f1,0,1,5)
% integral =
%    1.5000
% >> integral = gauss_quad(f1,0,1,4) 
% integral =
%     1.5000
% >> integral = gauss_quad(f1,0,1,1)
% integral =
%      1
% >> integral = gauss_quad(f1,0,1,[])
% integral =
%     1.5000
% >> integral = gauss_quad(f1,0,1,2)
% integral =
%     1.5000
% >> integral = gauss_quad(f1,0,1,3)
% integral =
%     1.5000
% >> integral = gauss_quad(f1,0,1,4)
% integral =
%     1.5000
% >> integral = gauss_quad(f1,0,1,5)
% integral =
%     1.5000

% f2=@(x) x^2+sin(x)
% >> integral = gauss_quad(f2,0,1)
% integral = 
%     0.7930
% >> integral = gauss_quad(f2,0,1,1)
% integral = 
%     0
% >> integral = gauss_quad(f2,0,1,2)
% integral = 
%     0.7929
% >> integral = gauss_quad(f2,0,1,3)
% integral = 
%     0.7930
% >> integral = gauss_quad(f2,0,1,4)
% integral = 
%     0.7930
% >> integral = gauss_quad(f2,0,1,5)
% integral = 
%     0.7930
% >> integral = gauss_quad(f2,0,1,[])
% integral = 
%     0.7930
% >> integral = gauss_quad(f2,0,[],3)
% Error using gauss_quad (line 61)
% USAGE for gauss_quad.m: integral =
% gauss_quad(func,x_min,x_max,num_points)
% >> integral = gauss_quad(f2,0,1,0)
% Error using gauss_quad (line 127)
% You entered a number of points greater than 5, which is currently 
% unsupported in gauss_quad.m, please enter a value
% between 1 and 5 for the number of points

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %sets a usage statement
    if ((nargin < 3) || isempty(func) || isempty(x_max) || isempty(x_min))
        error(['At least three inputs are required';...
            'USAGE for gauss_quad.m: integral = gauss_quad(func,'...
            'x_min,x_max,num_points)'])
    end
    
    %set the default value for num_points to 5
    if ((nargin < 4) || isempty(num_points))
        num_points = 5;
    end
    
    %the u substitutions, first is to be added to u value
    u0 = (x_max + x_min) / 2;
    %second is to be multiplied to u value later on
    u1 = (x_max - x_min) / 2;
    
    %set the initial value for dx
    dx = ((x_max - x_min)/2);
    
    switch num_points
        %Single Point Gauss Quadrature
        case 1
            c0 = 2;
            x0 = 0.0;
            integral = c0 * func(x0);
            
        %2 point Gauss Quadrature
        case 2
            c0 = 1;
            c1 = 1;
            x0 = u0 + u1 * -1/sqrt(3);
            x1 = u0 + u1 * 1/sqrt(3);
            integral = c0 * func(x0) + c1 * func(x1);
            
        %3 point Gauss Quadrature
        case 3
            c0 = 5/9;
            c1 = 8/9;
            c2 = 5/9;
            x0 = u0 + u1 * -sqrt(3/5);
            x1 = u0 + u1 * 0.0;
            x2 = u0 + u1 * sqrt(3/5);
            integral = c0 * func(x0) + c1 * func(x1) + c2 * func(x2);
            
        %4 point Gauss Quadrature
        case 4
            c0 = (18-sqrt(30))/36;
            c1 = (18+sqrt(30))/36;
            c2 = (18+sqrt(30))/36;
            c3 = (18-sqrt(30))/36;
            x0 = u0 + u1 * -sqrt(525+70*sqrt(30))/35;
            x1 = u0 + u1 * -sqrt(525-70*sqrt(30))/35;
            x2 = u0 + u1 * sqrt(525-70*sqrt(30))/35;
            x3 = u0 + u1 * sqrt(525+70*sqrt(30))/35;
            integral = c0 * func(x0) + c1 * func(x1) + c2 * func(x2) + ...
                c3 * func(x3);
        
        %Gauss Quadrature with 5 points
        case 5
            c0 = (322 - 13 * sqrt(70))/900;
            c1 = (322 + 13 * sqrt(70))/900;
            c2 = 128 / 225;
            c3 = (322 + 13 * sqrt(70))/900;
            c4 = (322 - 13 * sqrt(70))/900;
            x0 = u0 + u1 * -sqrt(245 + 14 * sqrt(70))/21;
            x1 = u0 + u1 * -sqrt(245 - 14 * sqrt(70))/21; 
            x2 = u0 + u1 * 0.0;
            x3 = u0 + u1 * sqrt(245 - 14 * sqrt(70))/21;
            x4 = u0 + u1 * sqrt(245 + 14 * sqrt(70))/21;
            integral = c0 * func(x0) + c1 * func(x1) + c2 * func(x2) + ...
                c3 * func(x3) + c4 * func(x4);
            
        %outputs an error statement if the number of points is not
        %supported
        otherwise
            error(['You entered a number of points greater than 5, ',... 
                'which is currently unsupported in gauss_quad.m, ',...
                'please enter a value between 1 and 5 for the number',...
                ' of points'])
    end
    
    %substitute dx back into the integral formula
    integral = integral * dx;
            
    
end