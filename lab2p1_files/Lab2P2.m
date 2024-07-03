weight = 0.5;
service = 'Ground';

% Call the function
[cost, err] = computeShippingCost(weight, service);

% Display the result
if isempty(err)
    fprintf('The cost of shipping is $%.2f\n', cost);
else
    disp(err);
end