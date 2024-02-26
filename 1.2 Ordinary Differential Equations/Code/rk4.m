function [y,error] = rk4(x0,y0,h,xn)
%RK4
    function f = f(x,y)
        f = -16.*y + 15*exp(-x);
    end
    function y = sol(x)
        y = exp(-x) - exp(-16.*x);
    end
    n = (xn - x0)/h;
    x = x0;
    y = y0;
    for i=1:n
    k1= h*vpa(f(x,y));
    k2 = h*vpa(f(x+h/2,y+k1/2));
    k3 = h*vpa(f(x+h/2,y+k2/2));
    k4 = h*vpa(f(x+h,y+k3));
    y = vpa(y) + (k1+2*k2+2*k3+k4)/6;
    x = vpa(x) + h;
    %disp([num2str(i),' & ',char(x),' & ',char(y),' & ',char(sol(x)),' \\'])
    end
    error = vpa(y-sol(x));
end