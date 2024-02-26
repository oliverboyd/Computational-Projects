function [mode,accuracy,iterations] = findmode(f,a,b,p)
%FINDMODE Function to find the mode of a unimodal function
%
%   FINDMODE(f,a,b,p) finds the mode of a unimodal functon f in the
%   interval [a,b] with precision p, and returns the mode, accuracy and
%   number of iterations performed.
%
    if b - a >= 2*p
        y = (sqrt(5) - 1)*(b - a)/2 + a;
        x = b + a - y;
        fx = f(x);
        fy = f(y);
    end
    i = 0; % iteration counter
    while b - a >= 2*p
        i = i + 1;
        if fx < fy
            a = x;
            if (b - a)< 2*p
                break
            end
            x = y;
            y = (sqrt(5) - 1)*(b - a)/2 + a;
            fx = fy;
            fy = f(y);
        else
            b = y;
            if (b - a) < 2*p
                break
            end
            y = x;
            x = b - (sqrt(5) - 1)*(b - a)/2;
            fy = fx;
            fx = f(x);
        end
    end
    mode = (b + a)/2;
    accuracy = (b - a)/2;
    iterations = i;
end
