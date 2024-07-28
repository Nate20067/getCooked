function area = computeArea(inputMatrix, pixelArea)
    %The area
    area = 0;
    
    %Dimensions of the input matrix
    [rows, cols] = size(inputMatrix);
    
    %Iterates through elements of matrix
    for i = 1:rows
        for j = 1:cols
            %If element is 1, add the pixel area to the total area
            if inputMatrix(i, j) == 1
                area = area + pixelArea;
            end
        end
    end
end
