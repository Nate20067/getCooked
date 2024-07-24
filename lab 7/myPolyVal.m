function y = myPolyVal(p, x)
    % Validate inputs
    if isempty(p)
        error('Polynomial coefficients cannot be empty.');
    end
    
    % Evaluate the polynomial
    y = polyval(p, x);
end
