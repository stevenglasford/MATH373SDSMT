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