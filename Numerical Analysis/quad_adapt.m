function integral = quad_adapt(func,x_min,x_max,tolerance)
    %This function is a recursive function, there are no error checking in
    %this function because it is assumed that error and default checking
    %will be conducted by a seperate heading file in our case this separate
    %file will be contained in quad_step.m
    
    %set the initial values for the different x_barX and IX values (where X
    %is a number or direction)
    x_bar = (x_min + x_max) / 2;
    x_barl = (x_min + x_bar) / 2;
    x_barr = (x_bar + x_max) / 2;
    I1 = (x_max - x_min)/6 * (func(x_min) + 4 * func(x_bar) + func(x_max));
    I2 = (x_max - x_min)/12 * (func(x_min) + 4 * func(x_barl) + 2 * ...
        func(x_bar) + 4 * func(x_barr) + func(x_max));
    
    %If the difference falls within a tolerance value the function makes
    %one final calculation using a single iteration of Romberg
    if (abs(I2 - I1) <= tolerance)
        %a single iteration of Romberg
        integral = (16/15) * I2 - (1/15) * I1;
    else
        %if it isn't in the tolerance, then the function recurses, for both
        %the left and right sides to try and get a better approximation
        integral_left = quad_step(func,x_min,x_bar,tolerance);
        integral_right = quad_step(func,x_bar,x_max,tolerance);
        %adds all of the integral calculations together
        integral = integral_left + integral_right;
    end
end