function [f, Re] = computeFrictionFactor(velocity, pipe_parameters, fluid_properties)
    % Unpack the input parameters
    D = pipe_parameters(1); % Diameter of the pipe
    epsilon = pipe_parameters(2); % Roughness of the pipe
    rho = fluid_properties(1); % Density of the fluid
    mu = fluid_properties(2); % Dynamic viscosity of the fluid

    % Computes the Reynolds number
    Re = (rho * velocity * D) / mu;

    % the flow regime and compute the friction factor
    if Re < 2000
        % Laminar flow
        f = 64 / Re;
    elseif Re > 4000
        % Turbulent flow
        % Define the Colebrook equation as a function handle
        colebrook = @(f) 1/sqrt(f) + 2*log10(epsilon/(3.7*D) + 2.51/(Re*sqrt(f)));
        % Use fsolve to solve for the friction factor f
        options = optimset('Display', 'off');
        f = fsolve(colebrook, 0.02, options);
    else
        % Transitional flow
        f = -1;
    end
end
