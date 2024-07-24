function B = myInverse(A)
    n = size(A, 1);
    B = zeros(n);

    % Compute inverse using LU decomposition
    [L, U, P] = luDecomposition(A);

    % Solve for each column of the identity matrix
    for i = 1:n
        e = zeros(n, 1);
        e(i) = 1;
        y = forwardSubstitution(L, e, P);
        B(:, i) = backSubstitution(U, y);
    end
end
