function [status, result] = computeCofactor(a1, row_index, column_index)
    [status, minor] = computeMinor(a1, row_index, column_index);
    if status == 1
        result = ((-1)^(row_index + column_index)) * minor;
    else
        result = [];
    end
end
