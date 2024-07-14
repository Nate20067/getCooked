% test case 1
velocity = 0.1; 
pipe_params = [0.1, 10e-6]; 
fluid_params = [103, 0.8e-3];
[f, Re] = computeFrictionFactor(velocity, pipe_params, fluid_params);
fprintf('Test Case 1: f = %.4f, Re = %.2f\n', f, Re);

% test case 2
velocity = 1; 
pipe_params = [0.1, 10e-6]; 
fluid_params = [103, 0.8e-3];
[f, Re] = computeFrictionFactor(velocity, pipe_params, fluid_params);
fprintf('Test Case 2: f = %.4f, Re = %.2f\n', f, Re);

% test case 3
velocity = 2; 
pipe_params = [0.05, 5e-6]; 
fluid_params = [103, 0.8e-3];
[f, Re] = computeFrictionFactor(velocity, pipe_params, fluid_params);
fprintf('Test Case 3: f = %.4f, Re = %.2f\n', f, Re);

% test case 4
velocity = 0.05; 
pipe_params = [0.05, 5e-6]; 
fluid_params = [103, 0.8e-3];
[f, Re] = computeFrictionFactor(velocity, pipe_params, fluid_params);
fprintf('Test Case 4: f = %.4f, Re = %.2f\n', f, Re);

% test case 5
velocity = 0.5; 
pipe_params = [0.06, 1e-6]; 
fluid_params = [900, 30e-3];
[f, Re] = computeFrictionFactor(velocity, pipe_params, fluid_params);
fprintf('Test Case 5: f = %.4f, Re = %.2f\n', f, Re);
