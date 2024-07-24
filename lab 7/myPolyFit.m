function p = myPolyFit(x, y)
    % Validates inputs
    if length(x) ~= length(y)
        error('x and y must be the same length.');
    end
    
    % Fits a polynomial of degree n-1
    n = length(x) - 1;
    p = polyfit(x, y, n);
end
