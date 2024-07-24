function yy = lagrangeInterpolation(x, y, xx)
    % Validates inputs
    if length(x) ~= length(y)
        error('x and y must be the same length.');
    end
    
    n = length(x);
    m = length(xx);
    yy = zeros(1, m);
    
    for k = 1:m
        L = ones(1, n);
        for i = 1:n
            for j = 1:n
                if j ~= i
                    L(i) = L(i) * (xx(k) - x(j)) / (x(i) - x(j));
                end
            end
        end
        yy(k) = sum(y .* L);
    end
end
