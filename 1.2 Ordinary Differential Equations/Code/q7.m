h = zeros(13,1);
for k=0:12
    h(k+1)= 0.1/2^k;
end
e = zeros(13,1);
y = zeros(13,1);
for i = 0:12
    [y1,error1]=q6rk4(h(i+1),1);
    y(i+1)=y1;
    e(i+1)=vpa(error1);
    disp([num2str(i),' & ',num2str(h(i+1)),' & ',num2str(y(i+1),15),' & ',num2str(e(i+1)),' \\'])
end

function [y,error] = q6rk4(h,xn)
%RK4
    function [f1,f2] = f(x,y,z)
        f1 = vpa(z);
        f2 = -p^2*(1+x)^(-a)*vpa(y);
    end
    function y = sol(x)
        y = (1+vpa(x))*(1/p)*sin((p*x)/(1+x));
    end
    p = 7;
    a = 4;
    x0 = 0;
    y0= 0;
    z0 = 1;
    n = (xn-x0)/h;
    x = x0;
    y = y0;
    z = z0;
    for i=1:n
        [f1,f2] = f(x,y,z); k1 = vpa(h).*[f1,f2];
        [f1,f2] = f(x+h/2,y+k1(1)/2,z+k1(2)/2); k2 = vpa(h).*[f1,f2];
        [f1,f2] = f(x+h/2,y+k2(1)/2,z+k2(2)/2); k3 = vpa(h).*[f1,f2];
        [f1,f2] = f(x+h,y+k3(1),z+k3(2)); k4 = vpa(h).*[f1,f2];
        y = vpa(y) + (k1(1)+2*k2(1)+2*k3(1)+k4(1))/6;
        z = vpa(z) + (k1(2)+2*k2(2)+2*k3(2)+k4(2))/6;
        x = vpa(x) + h;
    end
    error = vpa(y-sol(x));
end