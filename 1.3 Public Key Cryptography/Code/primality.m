function [output] = primality(n)
%PRIMALITYTEST Function to determine whether a natural number under 10^15
%is prime or not.
    d=2;
    tic
    if n<=1
        output = "Not Prime";
        return
    end
    while d*d <= n
        if mod(n,d) == 0
            output = "Not Prime";
            toc
            return
        end
        d=d+1;
    end
    output="Prime";
    toc
end