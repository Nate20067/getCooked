function [root, rootValue, estimatedError, iterations] = newtonRaphsonMethod(f, df, initialGuess, tol, maxIter)
    x = initialGuess;
    for i = 1:maxIter
        x_new = x - f(x)/df(x);
        estimatedError = abs(x_new - x);
        if estimatedError < tol
            root = x_new;
            rootValue = f(root);
            iterations = i;
            return;
        end
        x = x_new;
    end
    error('The method did not converge within the maximum number of iterations');
end