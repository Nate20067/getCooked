function v = computeVelocity(m,A,Cd,mur,P)
    rho = 1.25;
    g = 9.81;

    v0 = (2*P/(rho*Cd*A))^(1/3);

    powerFunc = @(v) 0.5*rho*Cd*A*v^3+mur*m*g*v-P;

    v = fzero(powerFunc, v0);

end