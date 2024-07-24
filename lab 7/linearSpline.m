function yy = linearSpline(x, y, xx)
    % Validates inputs
    if length(x) ~= length(y)
        error('x and y must be the same length.');
    end
    
    % Sorts x and y for consistency
    [x, sortIdx] = sort(x);
    y = y(sortIdx);
    
    % Initializes the output
    yy = zeros(size(xx));
    
    % Performs linear interpolation
    for k = 1:length(xx)
        if xx(k) <= x(1)
            yy(k) = y(1);
        elseif xx(k) >= x(end)
            yy(k) = y(end);
        else
            for i = 1:length(x)-1
                if xx(k) >= x(i) && xx(k) <= x(i+1)
                    % Linear interpolation formula
                    yy(k) = y(i) + (y(i+1) - y(i)) * (xx(k) - x(i)) / (x(i+1) - x(i));
                    break;
                end
            end
        end
    end
end
