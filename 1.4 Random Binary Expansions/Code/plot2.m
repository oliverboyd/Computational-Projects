n=11;
p=1/4;
x = zeros(1,2^n+1);
y = zeros(1,2^n+1);
for i = 1:2^n+1
    x(i) = (i-1)/2^n;
    y(i) = f(x(i),p,n);
end
plot(x,y)
grid on
ylabel('$$F(x)$$','Interpreter','LaTeX')
xlabel('$$x$$','Interpreter','LaTeX')