function integral = trapezoid_data(x_vals,y_vals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Steven Glasford
% March 11, 2018 
% trapezoid_data

% Find the area under a given data set points
% 
% Inputs: 
% x_vals - the column vector containing all of the x values
% y_vals - the column vector containing all of the y (or f(x)) values
%
% Outputs: 
% integral - the area under the data sets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x_vals = [2.1;2.4;2.7;3.0;3.3;3.6]
% y_vals = [3.2;2.7;2.9;3.5;4.1;5.2]
% integral = trapezoid_data(x_vals,y_vals)
% integral = 
%     5.22

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%checks that there are exactly two inputs
if (nargin ~= 2)
    error(['There were not enough inputs for trapezoid_data'
        'USAGE: integral = trapezoid_data(x_vals,y_vals)'])
end

%makes sure neither inputs are empty inputs
if ((isempty(x_vals)==true) || (isempty(y_vals)))
    error('Either x_vals or y_vals had empty inputs')
end

%check if x_vals is a valid column vector
if (iscolumn(x_vals) == 0) 
    error('x_vals input is not a column vector')
end
    
%check if y_vals is a valid column vector.
if  (iscolumn(y_vals) == 0)
    error('y_vals input is not a column vector')
end
%since a column vector has needs to have two points in order to be a vector
%any vector automatically has at least 2 slices

%checks if both vectors have the same vector size
if (size(x_vals) ~= size(y_vals))
    error(['the vectors x_vals and y_vals are not the same size in'...
        ' trapezoid_data'])
else
    %determines the number of slices for the computations
    num_slices = size(x_vals);
end

integral = 0.0;

%finds the integral using the non-uniform grid technique
for i = 2:num_slices
    integral = integral + ((y_vals(i-1) + y_vals(i))/2)...
        *(x_vals(i)-x_vals(i-1));
end

end