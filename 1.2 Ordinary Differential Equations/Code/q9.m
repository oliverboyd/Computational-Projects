function [diff, gp] = q9(eps, h, p1, p2)
    % Function to find a root of g using the secant method and perform additional calculations.
    
    % Initial guesses
    gp1 = g(p1);
    gp2 = g(p2);
    
    % Check if initial guesses are valid
    if sign(gp1) == sign(gp2)
        disp('Please choose an interval [p1,p2] such that g(p1) and g(p2) have opposite signs');
        return;
    end
    
    % Iteratively apply the secant method
    while abs(gp1) >= eps
        p = (gp2 * p1 - gp1 * p2) / (gp2 - gp1); % Secant method update
        gp = g(p);
        
        if sign(gp) == sign(gp1)
            p1 = p;
            gp1 = gp;
        else
            p2 = p;
            gp2 = gp;
        end
    end
    
    disp(['Root found: ', num2str(p)]);
    
    % Perform additional calculations
    x = linspace(0, 1, 1000);
    y1 = zeros(1, 1000);
    for k = 1:1000
        [out1, ~] = rk4part2(h, x(k), p, 8);
        y1(k) = out1;
    end
    
    d = (y1 - 2) ./ ((1 + x) - 8);
    i = trapz(x, d);
    c = 1 / (p * sqrt(i));
    y = c .* y1;
    
    % Plot results
    plot(x, y);
    grid on;
    hold on;
    xlabel('x');
    ylabel('y');
    
    % Nested function for g
    function y = g(p)
        [y, ~] = rk4_v2(h, 1, p, 8);
    end
end