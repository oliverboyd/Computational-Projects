u = linspace(17.5,30.5,1000);
v = zeros(1000,1);
for i = 1:1000
    v(i) = deltaphi(u(i));
end
plot(u,v,"LineWidth",1.0)
grid on
xlabel("d") 
ylabel("\Delta\phi")

function dp = deltaphi(d)
    left = phi(6.5,d);
    right = phi(16,d);
    if left> right
        phimax = left;
    else
        phimax = right;
    end
    minusphi = @(x) - phi(x,d);
    xmin = findmode(minusphi,6.5,16,0.01);
    dp = phimax - phi(xmin,d);
end

function p = phi(x,d)
    p = asin((x^2+24^2-d^2)/(2*24*x));
end