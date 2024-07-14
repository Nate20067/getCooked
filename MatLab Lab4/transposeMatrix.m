function [status, result] = transposeMatrix(a1)
    [r, c] = size(a1);
    status = 1;
    result = zeros(c, r);
    for i = 1:r
        for j = 1:c
            result(j,i) = a1(i,j);
        end
    end
end
