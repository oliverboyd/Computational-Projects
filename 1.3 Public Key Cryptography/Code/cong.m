function [x] = cong(a,b,m)
    %CONG Function to solve the linear congruence ax = b (mod m).
    [d,u,v] = euclid(a,m);
    if mod(b,d) ~= 0
        x='No solutions exist';
        return
    end
    p=a/d;
    q=m/d;
    [c,s,t] = euclid(p,q);
    x0=mod(s*b/d,m/d);
    x = zeros(1,d);
    for k=1:d
        x(k)=x0+(k-1)*m/d;
    end
end