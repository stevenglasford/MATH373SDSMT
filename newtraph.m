function [root,ea,iter] = newtraph
func = @(m)sqrt(9.81*m/.25)*tan(sqrt(9.81*.25/m)*4)-3;
dfunc = @(m)1/2*sqrt(9.81/(m*.25))*tanh((9.81*.25/m)^(1/2)*4)-9.81/(2*m)*sech(sqrt(9.81*.25/m)*4)^2;
xr = 140;
es = .00001;
ea = 100;
maxit = 50;
iter =0;
xrold = xr;
while (ea>es && iter < maxit)
    xrold = xr;
    xr = xr - (func(xr))/(dfunc(xr));
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100;
    end
end
    
end