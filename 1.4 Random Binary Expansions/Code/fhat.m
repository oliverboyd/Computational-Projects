function [output] = fhat(x,p,n,N)
%FHAT A Monte Carlo simulation to approximation the cumulative
%distribution function F.
    U = zeros(1,n);
    b = zeros(1,n);
    X = zeros(1,N);
    f = zeros(1,N);
    for i=1:n
        b(i)=1/2^i;
    end
    for i=1:N
        for j=1:n
            U(j)=binornd(1,p);
        end
        X(i)=dot(U,b);
        if X(i) <= x
            f(i) = 1;
        else
            f(i) = 0;
        end
    end
    output = sum(f)/N;
end