%Script claculates the cost of shipping a package based on its weight 

%Prompt user for the weight and service
weight = input('Enter weight of package in pounds: ');
service = input('Enter the service wanted(1 for ground, 2 for 2nd day, 3 for overnight): ', 's');

%Test case for weight
if weight <= 0
    disp('weight must be greater than zero');
    return 
end

%Determine the cost based on the weight and service type
switch service 
    case '1' %for the ground
        if weight > 50 
            disp('Service is not avalaible for packages over 50lbs')
        elseif weight <= 2
            cost = 1.50;
        elseif weight <=10
            cost = 1.50 + 0.50 * (weight - 2);
        else 
        
            cost = 5.50 + 0.30 * (weight - 10);
        end

    case '2'% for 2nd day
        if weight > 50 
            disp('Service is not avalaible for packages over 50lbs')
        elseif weight <= 2
            cost = 3.00;
        elseif weight <=10
            cost = 3.00 + 0.90 * (weight - 2);
        else 
            cost = 10.20 + 0.60 * (weight - 10);
        end

    case '3' %for overnight
        if weight > 10 
            disp('Overnight service is not avalaible for packages over 10lbs')
        elseif weight <= 2
            cost = 18.00;
        else
            cost = 18.00 + 6.00 * (weight-2);

        end

end

%Displays the calculated cost is valid
if exist('cost', 'var')
    %Printing the calculated cost
    fprintf('The cost of shipping is $%.2f\n', cost)
end

