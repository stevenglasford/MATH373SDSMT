function integral = simpsons_third(func,x_min,x_max,num_slices)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% March 11, 2018 
% simpsons_third

% Find the area under a function using simpsons one third rule
% 
% Inputs: 
% func - the input function
% x_min - the lower bound for the integral calculation
% x_max - the upper bound for the integral calculation
% num_slices - the number of slice used in the calculation
%
% Outputs: 
% integral - the area under the function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f1 =@(x)x+exp(x)
% integral = simpsons_third(f1,0,1)
% integral = 
%     2.2183

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f2 =@(x)x^2+sin(x)
% integral = simpsons_third(f2,0,1)
% integral = 
%     0.7930

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%determine if there are at least 3 input arguments
if (nargin < 3)
    error(['Not enough inputs for simpsons_third '
    'USAGE: integral = simpsons_third(func,x_min,x_max,num_slices)'])
end

%set a default num_slices if necessary
if ((nargin < 4) || isempty(num_slices))
    num_slices = 50;
end

%determine if the number of slices is at least 2
if (num_slices < 2)
    error('Not enough slices for simpsons_third, at least 2 required')
end

%determine if the number of slices is an even number
if (mod(num_slices,2) ~= 0)
    error(['The number of slices is not even, which is required for '
        ' simpons_third'])
end

%sets the initial value for the integral value
integral = 0.0;

%add the first minimum point to the vector x
x(1) = x_min;

%add the first point to the list
integral = func(x_min);

step = (x_max - x_min)/(num_slices);
 %calculates the integral
 for i = 2:num_slices
     %This will increment the size of x(i) by one for each iteration
     x(i)=x(i-1)+step;
     %The actual calculation is different for when the iteration is odd 
     %or even
     if (mod(i,2)==0)
         %this is for the even points
         integral = integral + 4 * func(x(i));
     else
         %this is for the odd points
         integral = integral + 2 * func(x(i));
     end
 end

%add the final point to the integral
integral = integral + func(x_max);

%one last calculation
integral = (integral*step) / 3;

end