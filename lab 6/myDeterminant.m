function d = myDeterminant(A)
    [~, U, P] = luDecomposition(A);
    d = det(P) * prod(diag(U));
end
