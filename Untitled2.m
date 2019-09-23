%Newton-Raphson method to estimate the root of a equation
%@Md Khirul Alam Titu
%24/5/2016
syms x;
f=6*x^3-5*x^2+7*x-2; %put your desire equation.suppose exp(-x)-x ;
fd=diff(f);%First derivative
xold=1;  %initial guess
for k=1:5;
    xnew=xold;
    xold=xold-subs(f,xold)/subs(fd,xold);
    error=abs((xnew-xold)/xnew)*100;%approximate percentage relative error
    [xold  error] %dispaly
    
    
end
