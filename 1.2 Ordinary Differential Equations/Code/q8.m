function [diff,gp] = q8(eps,h)
    p1=6;
    p2=7;
    p=p1;
    gp1=g(p1);
    gp2=g(p2);
    gp=gp1;
    if sign(gp1)==sign(gp2)
        disp('Please choose an interval [p1,p2] such that g(p1) and g(p2) have opposite signs')
        return
    end
    while abs(gp)>=eps
        p = (gp2*p1-gp1*p2)/(gp2-gp1);
        gp = g(p);
        if sign(gp1) == sign(gp)
            p1 = p;
            gp1 = gp;
        elseif sign(gp2) == sign(gp)
            p2 = p;
            gp2 = gp;
        else
            break
        end
    end
    err = gp;
    diff = p-2*pi;
    function y = g(p)
        y = rk4_v2(h,1,p,4); % yet to be defined
    end
end