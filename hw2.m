function [one,two,three,four,five,one_bi,two_bi,three_bi,four_bi...
    ,five_bi] = hw2()

%initial values for the complicated nonlinear formula
r = 2.15/12;
L = 7.5/12;
gammaC = 140;
gammaW = 62.4;


%the nonlinear formula for the concrete sailboat thing
boat = @(f) -(1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW+.2+((1/2)...
    *pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;

%this will produce the first five values for part a
t=(1/8)/12;
%one = vpasolve(boat(t,f)==0,f);
%[one,func_val,error_approx,num_iterations] = ...
%    newton_raphson(boat,dboat,x_guess,error_desired,max_iterations)
boat = @(f) (1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW-.2-((1/2)*pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;
[one,func_val,error_approx,num_iterations] = secant(boat,9,10);
[one_bi,func_val,error_approx,num_iterations] =bisection (boat,0,10);

t=(3.0/16.0)/12;
%two = vpasolve(boat(t,f)== 0,f);
boat = @(f) (1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW-.2-((1/2)*pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;
[two,func_val,error_approx,num_iterations] = secant(boat,9,10);
[two_bi,func_val,error_approx,num_iterations] =bisection (boat,0,10);

t = (1.0/4.0)/12;
%three = vpasolve(boat(t,f)==0,f);
boat = @(f) (1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW-.2-((1/2)*pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;
[three,func_val,error_approx,num_iterations] = secant(boat,9,10);
[three_bi,func_val,error_approx,num_iterations] =bisection (boat,0,10);

t = (5.0/16.0)/12;
%four = vpasolve(boat(t,f)==0,f);
boat = @(f) (1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW-.2-((1/2)*pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;
[four,func_val,error_approx,num_iterations] = secant(boat,9,10);
[four_bi,func_val,error_approx,num_iterations] =bisection (boat,0,10);

t = (3.0/8.0)/12;
%five = vpasolve(boat(t,f)==0,f);
boat = @(f) (1/2)*r^2*(2*acos(f/r)-sin(2*acos(f/r)))*L*gammaW-.2-((1/2)*pi*r^2*L-(1/2)*pi*(r-t)^2*(L-2*t))*gammaC;
[five,func_val,error_approx,num_iterations] = secant(boat,9,10);
[five_bi,func_val,error_approx,num_iterations] =bisection (boat,0,10);

end