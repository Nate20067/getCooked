function [status, result] = computeMinor(a1, row_index, column_index)
    [rows, cols] = size(a1);
    if row_index > rows || column_index > cols
        status = 0;
        result = [];
        return;
    end

    minorMatrix = a1([1:row_index-1, row_index+1:end], [1:column_index-1, column_index+1:end]);
    [status, result] = computeDeterminant(minorMatrix);
end
