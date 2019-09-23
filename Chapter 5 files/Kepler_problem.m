function data = Kepler_problem()
% Solves Kepler's equation

% Allocate space for data
data = zeros(2,4);

% Save the working directory
current_folder = pwd;

% Constants
e = 0.048;
M=pi/4;

% Function definition
Kepler = @(E) E - e*sin(E) - M;

% Parameters
x_min = 0.7;
x_max = 0.9;

% Change to the appropriate directory
cd C:\Users\bdescham\Numerical\Root-Finding

% Bisection
[data(1,1),data(1,2),data(1,3),data(1,4)] = bisection(Kepler,x_min,x_max);

% False Position
[data(2,1),data(2,2),data(2,3),data(2,4)] =...
    false_position(Kepler,x_min,x_max);

% Change folder back
cd(current_folder);

end