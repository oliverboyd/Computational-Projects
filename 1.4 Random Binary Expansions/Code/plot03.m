c=9/16;
n=11;
p=3/4;
d = zeros(1,2^n+1);
y = zeros(1,2^n+1);
for i = 1:2^n+1
    d(i) = (i-1)/2^n - 1/2;
    y(i) = (f(c+d(i),p,n)-f(c,p,n))/d(i);
end
plot(d,y)
grid on
ylabel('$$(F(c + \delta)-F(c))/\delta$$','Interpreter','LaTeX')
xlabel('$$\delta$$','Interpreter','LaTeX')