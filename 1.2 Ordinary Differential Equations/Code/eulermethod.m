function [y,error] = eulermethod(x0,y0,h,xn)
%EULERMETHOD
    function f = f(x,y)
        f = -16.*y + 15*exp(-x);
    end
    function y = sol(x)
        y = exp(-x) - exp(-16.*x);
    end
    n = (xn-x0)./h;
    x = x0;
    y = y0;
    for i=1:n
        y = y + h.*f(x,y);
        x = x + h;
        %disp([num2str(i),' & ',num2str(x),' & ',num2str(y),' & ',num2str(sol(x)),' \\'])
    end
    error = y-sol(x);
end