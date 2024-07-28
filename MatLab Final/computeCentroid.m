function [xcm, ycm] = computeCentroid(inputMatrix, pixelArea)
    %Dimensions of the matrix
    [M, N] = size(inputMatrix);  
    
    %Initialize x-coordinates
    xSum = 0; 
    %Initialize y-coordinates
    ySum = 0; 
    %Initialize total area
    totalArea = 0;  

    %Itterates each element in the matrix
    for i = 1:M
        for j = 1:N
            if inputMatrix(i, j) == 0  % Consider only black pixels
                xSum = xSum + j * pixelArea;
                ySum = ySum + i * pixelArea;
                totalArea = totalArea + pixelArea;
            end
        end
    end

    %Centroid coordinates Calculated
    xcm = xSum / totalArea;
    ycm = ySum / totalArea;
end


