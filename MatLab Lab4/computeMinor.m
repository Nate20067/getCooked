function [status, result] = computeMinor(a1, row_index, column_index)
    [r, c] = size(a1);
    
    if row_index > r || column_index > c
        status = 0;
        result = [];
    else
        status = 1;
        result = a1;
        result(row_index,:) = [];
        result(:,column_index) = [];
    end
end
