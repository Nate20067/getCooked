function T = computeForcesInTruss(loads)
    % Extract loads
    P2 = loads(1);
    P5 = loads(2);
    P6 = loads(3);
    
    % Define angles
    alpha1 = 28.5;
    alpha2 = 58.4;
    
    % Define matrix A using the given angles
    A = [
        cosd(alpha1) 1 0 0 0 0 0;
        sind(alpha1) 0 0 0 0 0 0;
        -cosd(alpha1) 0 -cosd(alpha2) 0 cosd(alpha2) cosd(alpha1) 0;
        -sind(alpha1) 0 -sind(alpha2) 0 -sind(alpha2) -sind(alpha1) 0;
        0 0 0 -1 -cosd(alpha2) 0 1;
        0 0 0 0 0 sind(alpha1) 0;
        0 0 0 0 0 -cosd(alpha1) -1
    ];

    % Define the right-hand side vector B
    B = [P2; -6521; -P2; 0; 0; -P6; 0];

    % Solve the system of equations
    F = A \ B;

    % Define the variable of number of truss members
    x = 1:1:7;

    % Create a table to display the results
    T = table(x', F);
    T.Properties.VariableNames = {'Member', 'Force'};

    % Display the values in table
    disp(T);
end
