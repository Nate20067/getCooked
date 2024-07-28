function Emissions = totalEmissionsByYear(data)
    %Emissions vector
    Emissions = [0, 0, 0, 0];

    %Total emissions for each category calculation
    %Coal
    Emissions(1) = sum(data(:, 2));
    %Natural Gas
    Emissions(2) = sum(data(:, 3));
    %Petroleum
    Emissions(3) = sum(sum(data(:, 4:13)));  % Sum of columns D to M
    %Bio-Fuels
    Emissions(4) = sum(sum(data(:, 14:16)));  % Sum of columns N to P
end
