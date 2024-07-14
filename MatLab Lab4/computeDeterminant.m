function [status, result] = computeDeterminant(a1)
    [r, c] = size(a1);
    
    if r ~= c
        status = 0;
        result = [];
    else
        status = 1;
        result = determinantHelper(a1);
    end
end

function det = determinantHelper(matrix)
    [n, ~] = size(matrix);
    
    if n == 1
        det = matrix(1,1);
    elseif n == 2
        det = matrix(1,1) * matrix(2,2) - matrix(1,2) * matrix(2,1);
    else
        det = 0;
        for col = 1:n
            minorMatrix = matrix;
            minorMatrix(1,:) = [];
            minorMatrix(:,col) = [];
            det = det + ((-1)^(1+col)) * matrix(1,col) * determinantHelper(minorMatrix);
        end
    end
end
