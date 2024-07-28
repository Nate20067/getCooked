function i = computeCurrents(R, V1)

    % the resistances
    R54 = R(1);
    R43 = R(2);
    R32 = R(3);
    R52 = R(4);
    R65 = R(5);
    R12 = R(6);
      
    % coefficient matrix A and the right-hand side vector B
    A = [
        1  -1   0   0   0   0;
        0   1  -1   0   0   0;
        0   1   0   1  -1   0;
        0   0   0   1   1  -1;
        -R54 -R43 -R32  R52  0   0;
        0    0    0  -R52 -R65 R12;
    ];
    
    B = [0; 0; 0; 0; 0; V1];
    
    % Solves system of linear equations
    i = A\B;
end