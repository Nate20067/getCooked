x = 3;
f = @(x) x^2 - 3*x + 2;
df = @(x) 2*x - 3;
err = 0.1;
[root, rootValue, estimatedError, iterations] = newtonRaphsonMethod(f, df, x, err);
disp([root, rootValue, estimatedError, iterations]);