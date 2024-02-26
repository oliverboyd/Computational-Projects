global theta
minusdeltaphi = @(x) - deltaphi(x);
mode = findmode(minusdeltaphi,17.5,30.5,0.001);
disp(['d = ',num2str(mode)])
disp(['Theta = ',num2str(theta)])


u = linspace(6.5,16,1000);
v = zeros(1000,1);
for i = 1:1000
    v(i) = phi(u(i),17.5);
end
plot(u,v,'LineWidth',1.0)
hold on
for i = 1:1000
    v(i) = phi(u(i),21.7);
end
plot(u,v,'LineWidth',1.0)
hold on
for i = 1:1000
    v(i) = phi(u(i),26);
end
plot(u,v,'LineWidth',1.0)
hold on
for i = 1:1000
    v(i) = phi(u(i),30.5);
end
plot(u,v,'LineWidth',1.0)
grid on
xlabel("x") 
ylabel("\phi") 
legend({'d = 17.5','d = 21.7','d = 26.0','d = 30.5'})


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
    xmin = findmode(minusphi,6.5,16,0.1);
    dp = phimax - phi(xmin,d);
    theta = (phimax + phi(xmin,d))/2;
end

function p = phi(x,d)
    p = asin((x^2+24^2-d^2)/(2*24*x));
end