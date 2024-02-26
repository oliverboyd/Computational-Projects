function [output] = f(x,p,n)
    if x==1
        output=1;
        return
    end
    q=zeros(1,n+1);
    r=zeros(1,n);
    q(n+1)=x*2^n;
    for i=1:n
        q(n-i+1)=floor(q(n-i+2)/2);
        r(n-i+1)=mod(q(n-i+2),2); % determining the x_i's
    end
    m=zeros(1,n+1);
    for i=1:n
        if r(i)==1
            m(i+1)=m(i)+1;
        else
            m(i+1)=m(i);
        end
    end
    s=0;
    for i=1:n
        s=s+r(i)*p^m(i)*(1-p)^(i-m(i));
    end
    output=s;
end