function [status, result] = computeDeterminant(a1)
    % Check if the matrix is square
    [rows, cols] = size(a1);
    if rows ~= cols
        status = 0;
        result = [];
        return;
    end

    % Base case for 2x2 matrix
    if rows == 2
        result = a1(1,1) * a1(2,2) - a1(1,2) * a1(2,1);
        status = 1;
        return;
    end

    % Recursive case for NxN matrix
    det = 0;
    for col = 1:cols
        minorMatrix = a1(2:end, [1:col-1, col+1:end]);
        [~, minorDet] = computeDeterminant(minorMatrix);
        det = det + ((-1)^(1+col)) * a1(1,col) * minorDet;
    end

    result = det;
    status = 1;
end
