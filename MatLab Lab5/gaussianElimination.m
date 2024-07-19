function [status, result] = gaussianElimination(a1)
    [rows, cols] = size(a1);
    result = a1;
    
    for k = 1:min(rows,cols)
        % Finds the pivot row
        [~, maxIndex] = max(abs(result(k:rows, k)));
        pivotRow = k + maxIndex - 1;
        
        if result(pivotRow, k) == 0
            status = 0;
            return;
        end
        
        % Swaps the current row with the pivot row
        if pivotRow ~= k
            temp = result(k, :);
            result(k, :) = result(pivotRow, :);
            result(pivotRow, :) = temp;
        end
        
        % Eliminates rows below
        for row = k+1:rows
            multiplier = result(row, k) / result(k, k);
            result(row, :) = result(row, :) - multiplier * result(k, :);
        end
    end
    
    status = 1;
end
