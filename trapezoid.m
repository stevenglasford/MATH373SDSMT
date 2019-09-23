% function integral = trapezoid(func,x_min,x_max,num_slices)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Steven Glasford
% % March 11, 2018 
% % trapezoid 
% 
% % Find the area under a given function 
% % 
% % Inputs: 
% % func - input function
% % x_min - lower x bound of interval 
% % x_max - upper x bound of interval 
% % num_slices - the number of slices to use the trapezoid rule to compute
% %
% % Outputs: 
% % integral - the area under the line 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % f1=@(x) x+1
% % >> integral = trapezoid(f1,0,1)
% % integral = 
% %     1.2189
% 
% % f2=@(x) x^2+sin(x)
% % >> integral = trapezoid(f2,0,1)
% % integral = 
% %     0.7931
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %Checks for the minimum number of input arguments 
% if (nargin <3)
%     error(['At least three arguments are required'
%         'USAGE: integral = trapezoid(func,x_min,x_max,num_slices)'])
% end
% 
% %set default num_slices to 50
% if (nargin < 4 || isempty(num_slices))
%     num_slices = 50;
% end
% 
% %checks that there are at least 2 slices, if not it returns an error
% if num_slices < 2
%     error('Not enough slices in trapezoid function')
% end
% 
% %set the initial integral to 0
% integral = 0.0;
% 
% %set the initial step size
% step = (x_max - x_min)/(num_slices-1);
% 
% %generate x values
% for i = 1:num_slices
%     x(i) = x_min + (i-1)*step;
% end
% 
% %generate y values
% for i = 1:num_slices
%     y(i) = func(x(i));
% end
% 
% %calculate the integra using trapezoidal rule
% for i = 1:num_slices
%     %the trapezoidal rule is different for the very first and
%     %and last slices
%     if (i == 1 || i == num_slices)
%         integral = integral + y(i)./2;
%     else
%         %all other points use this setup
%         integral = integral + y(i);
%     end
% end
% 
% %does the final calculation to find the integral
% integral = integral * step;
% 
% end

function I = trap(func,a,b,n)

    if nargin < 3
        error('At least 3 input arguments required')
    end
    
    if ~(b>a)
        error('Upper Bound must be greater than lower')
    end
    
    if nargin < 4 ||isempty(n)
        n = 100;
    end
    
    x = a;
    h = (b-a)/n;
    s = func(a);
    for i = 1 : n-1
        x = x + h;
        s = s + 2*func(x);
    end
    
    s = s + func(b);
    I = (b - a) * s/(2*n);
    
end    