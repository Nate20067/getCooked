function [L, U, P] = luDecomposition(A)
    n = size(A, 1);
    P = eye(n);
    L = eye(n);
    U = A;

    for k = 1:n-1
        % Partial Pivoting
        [~, pivot] = max(abs(U(k:n, k)));
        pivot = pivot + k - 1;

        if pivot ~= k
            % Swap rows in U
            U([k pivot], :) = U([pivot k], :);
            % Swap rows in P
            P([k pivot], :) = P([pivot k], :);
            if k >= 2
                % Swap rows in L
                L([k pivot], 1:k-1) = L([pivot k], 1:k-1);
            end
        end

        % Gaussian Elimination
        for j = k+1:n
            L(j, k) = U(j, k) / U(k, k);
            U(j, k:n) = U(j, k:n) - L(j, k) * U(k, k:n);
        end
    end
end
