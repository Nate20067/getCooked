function [cost, err] = computeShippingCost(weight, service)
    % Initialize cost and error message
    cost = -1;
    err = '';
    
    % Error check for weight
    if weight <= 0
        err = 'Weight must be a positive number.';
        return;
    end
    
    % Determine the cost based on weight and service type
    switch service
        case 'Ground'
            if weight > 50
                err = 'Service is not available for packages over 50 lb';
            elseif weight <= 2
                cost = 1.50;
            elseif weight <= 10
                cost = 1.50 + 0.50 * (weight - 2);
            else
                cost = 5.50 + 0.30 * (weight - 10);
            end
            
        case '2nd Day'
            if weight > 50
                err = 'Service is not available for packages over 50 lb';
            elseif weight <= 2
                cost = 3.00;
            elseif weight <= 10
                cost = 3.00 + 0.90 * (weight - 2);
            else
                cost = 10.20 + 0.60 * (weight - 10);
            end
            
        case 'Overnight'
            if weight > 10
                err = 'Overnight Service is not available for packages over 10 lb';
            elseif weight <= 2
                cost = 18.00;
            else
                cost = 18.00 + 6.00 * (weight - 2);
            end
            
        otherwise
            err = 'Invalid service type. Please enter Ground, 2nd Day, or Overnight.';
            return;
    end
end
