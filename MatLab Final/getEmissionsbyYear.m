function Emissions = getEmissionsbyYear(data, year)
    %Years from first column
    years = data(:, 1);

    yearIndex = find(years == year);

    %Emissions vector
    Emissions = [0, 0, 0, 0];

    if isempty(yearIndex)
        Emissions = [0, 0, 0, 0];
        return;
    end

    %Emissions for specific year calculated
    %Coal
    Emissions(1) = data(yearIndex, 2);
    %Natural Gas
    Emissions(2) = data(yearIndex, 3);
    %Petroleum
    Emissions(3) = sum(data(yearIndex, 4:13));
    %Bio-fuels
    Emissions(4) = sum(data(yearIndex, 14:16));
end

