function [output] = factorise(n)
    %FACTORISE Function to determine the prime factorisation of an integer.
    d=2;
    i=1;
    while d*d <= n
        if mod(n,d) == 0
            f(i)=d;
            n=n/d;
            i=i+1;
        else
            d=d+1;
        end
    end
    f(i)=n;
    output = f;
end