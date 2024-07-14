function [status, result] = subtractMatrices(a1, a2)
    [r1, c1] = size(a1);
    [r2, c2] = size(a2);
    
    if r1 ~= r2 || c1 ~= c2
        status = 0;
        result = [];
    else
        status = 1;
        result = zeros(r1, c1);
        for i = 1:r1
            for j = 1:c1
                result(i,j) = a1(i,j) - a2(i,j);
            end
        end
    end
end
