function [d,u,v] = euclid(a,b)
    %EUCLID Function to determine the greatest common divisor of a and b, and
    %integers u and v such that au + bv = gcd(a,b) by the Euclidean Algorithm.
    e=0;
    if a < b % swaps a and b so that a >= b
        c=a;
        a=b;
        b=c;
        e=1;
    end
    q=zeros(1,100);
    r=zeros(1,100);
    r(1)=a;
    r(2)=b;
    i=2;
    while r(i) > 0
        i=i+1;
        q(i)=floor(r(i-2)/r(i-1));
        r(i)=mod(r(i-2),r(i-1));
    end
    d = r(i-1); % the greatest common divisor
    l=zeros(1,100);
    m=zeros(1,100);
    l(1)=0;
    m(1)=1;
    for k=2:i-2 % reversing the algorithm using recurrence relations
        l(k)=m(k-1);
        m(k)=l(k-1)-q(i-k+1)*m(k-1);
    end
    u=l(i-2);
    v=m(i-2);
    if e==1 % swaps u and v in case a < b originally
        w=u;
        u=v;
        v=w;
    end
end