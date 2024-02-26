h = zeros(16,1);
for k=0:15
    h(k+1)= 0.1/2^k;
end
e = zeros(16,1);
f = zeros(16,1);
for i = 0:15
    [y1,error1]=eulermethod(0,0,h(i+1),0.1);
    e(i+1)=error1;
    [y2,error2]=rk4(0,0,h(i+1),0.1);
    f(i+1)=vpa(error2);
    %disp([num2str(i),' & ',num2str(h(i+1)),' & ',num2str(e(i+1)),' & ',num2str(f(i+1)),' \\'])
end
loglog(h,abs(e))
xlabel ('h')
ylabel('|E_n|')
grid on
hold on
loglog(h,abs(f))
legend('Euler Method','RungeKutta Method')
legend('Location','best')