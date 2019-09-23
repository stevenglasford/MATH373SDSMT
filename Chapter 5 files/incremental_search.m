function intervals = incremental_search(func,x_min,x_max,num_intervals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Brent Deschamp
% August 23, 2016
% Incremental search, Section 5.3.1

% Performs an incremental search on the interval [x_min,x_max] looking for
% sign changes and roots.  Outputs any subintervals found in the vector
% intervals.  num_intervals is the number of subintervals to create on
% [x_min,x_max].

% Inputs:
% func - function of interest
% x_min - lower value of interval
% x_max - upper value of interval
% num_intervals - number of subintervals to be used

% Outputs:
% intervals - an array of size nx2 that lists each subinterval in each row
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test inputs 1 (page 133)
% func = @(x) sin(10*x)+cos(3*x);
% intervals = incremental_search(func,3,6);
% Number of subintervals: 5

% intervals =

%    3.2449    3.3061
%    3.3061    3.3673
%    3.7347    3.7959
%    4.6531    4.7143
%    5.6327    5.6939
% intervals = incremental_search(func,3,6,100);
% Number of subintervals: 9

% intervals =
%    3.2424    3.2727
%    3.3636    3.3939
%    3.7273    3.7576
%    4.2121    4.2424
%    4.2424    4.2727
%    4.6970    4.7273
%    5.1515    5.1818
%    5.1818    5.2121
%    5.6667    5.6970

% x_vals = linspace(3,6,100);
% y_vals = func(x_vals);
% plot(x_vals,y_vals)
% plot(x_vals,y_vals); grid

% Test inputs 2 (Kepler's Equation)
% e = 0.048;  % eccentricity for Jupiter
% M = pi/4;   % mean anomaly
% Kepler = @(E) E - e*sin(E) - M;
% intervals = incremental_search(Kepler,0,2*pi,100);
% Number of subintervals: 1

% intervals =
%    0.7616    0.8251

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check to see if num_intervals has been entered
if(nargin < 3)
    error('At least three arguments required.');
end
if(nargin < 4) || isempty(num_intervals)
    num_intervals=50;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Incremental search
% Initialize values
x_vals = linspace(x_min,x_max,num_intervals);
num_found = 0;
intervals = [];

% Search each subinterval
for k=1:(length(x_vals)-1)
    if(sign(func(x_vals(k))) ~= sign(func(x_vals(k+1))))
        num_found = num_found+1;
        intervals(num_found,1) = x_vals(k);
        intervals(num_found,2) = x_vals(k+1);
    end
end

% Outputs
if(isempty(intervals))
    disp('No subintervals found.');
    disp('Check interval or increase the number of subintervals.');
else
    disp(['Number of subintervals: ' num2str(num_found)]);
end

end