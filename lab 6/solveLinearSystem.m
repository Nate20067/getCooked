function x = solveLinearSystem(A, b)
    [L, U, P] = luDecomposition(A);
    y = forwardSubstitution(L, b, P);
    x = backSubstitution(U, y);
end
