function [Ixx, Iyy, Ixy] = computeMomentsAboutOrigin(inputMatrix, pixelArea)
    %Dimensions of the matrix
    [M, N] = size(inputMatrix);  
    
    %Moment of inertia about x-axis
    Ixx = 0;  
    %Moment of inertia about y-axis
    Iyy = 0;  
    %Product of inertia inialized
    Ixy = 0;  

    %Iterates each element in matrix
    for i = 1:M
        for j = 1:N
            %Considers if black pixels
            if inputMatrix(i, j) == 0  
                y = i * pixelArea;
                x = j * pixelArea;
                Ixx = Ixx + (y^2 * pixelArea);
                Iyy = Iyy + (x^2 * pixelArea);
                Ixy = Ixy + (x * y * pixelArea);
            end
        end
    end
end