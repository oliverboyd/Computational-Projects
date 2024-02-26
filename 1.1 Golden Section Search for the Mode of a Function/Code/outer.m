u = linspace(0.0001,0.1,10000);
v = zeros(10000,1);
for i = 1:10000
    v(i)=turntable(u(i));
end
plot(u,v,"LineWidth",1.0)
xlabel("Outer Accuracy") 
ylabel("\theta")
grid on

function tt = turntable(out)
    global theta
    deltaphi1 = @(x) deltaphi(x);
    minusdeltaphi = @(x) - deltaphi1(x);
    findmode(minusdeltaphi,17.5,30.5,out);
    tt = theta;
end

function dp = deltaphi(d)
    global theta
    left = phi(6.5,d);
    right = phi(16,d);
    if left > right
        phimax = left;
    else
        phimax = right;
    end
    minusphi = @(x) - phi(x,d);
    xmin = findmode(minusphi,6.5,16,0.001);
    dp = phimax - phi(xmin,d);
    theta = (phimax + phi(xmin,d))/2;
end

function p = phi(x,d)
    p = asin((x^2+24^2-d^2)/(2*24*x));
end