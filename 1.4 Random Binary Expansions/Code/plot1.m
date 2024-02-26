m=2^7 + 1;
p=2/3;
n=30;
N=100000;
x = linspace(0,1,m);
y = zeros(1,m);
for i = 1:m
    y(i) = fhat(x(i),p,n,N);
end
plot(x,y)
grid on
ylabel('$$\hat{F}(x)$$','Interpreter','LaTeX')
xlabel('$$x$$','Interpreter','LaTeX')