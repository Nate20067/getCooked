function [status, x] = solveLinearEquations(A, b)
    [rows, cols] = size(A);
    if rows ~= length(b)
        status = 0;
        x = [];
        return;
    end
    
    augmentedMatrix = [A b];
    [status, rowEchelonForm] = gaussianElimination(augmentedMatrix);
    
    if status == 0
        x = [];
        return;
    end
    
    x = zeros(rows, 1);
    for i = rows:-1:1
        x(i) = (rowEchelonForm(i,end) - rowEchelonForm(i,1:cols) * x) / rowEchelonForm(i,i);
    end
    
    status = 1;
end
