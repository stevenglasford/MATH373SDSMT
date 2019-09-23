function h3()
    
    func = @(t) exp(-((100)*t)/(2*(5)))*cos(t*sqrt((1/(5*(10^-4)))-(100/(2*5))^2))-.5;
    
    %upper bound for the fzero
    upperbound = .04;
    %lowerbound for the fzero
    lowerbound = 0;
    
    %first guess for the IQI
    x_guess_one = 0;
    %second guess for the IQI
    x_guess_two = .02;
    %third guess for the IQI
    x_guess_three = .04;
    
    %find the actual root first
    fzero(func,[lowerbound,upperbound])
    
    %find the root using IQI
    [x_root,func_val,error_approx,num_terations] = IQI(func,x_guess_one...
        ,x_guess_two,x_guess_three)
    
end