function [Ixx_cent, Iyy_cent, Ixy_cent] = computeMomentsAboutCentroid(inputMatrix, pixelArea)
    %Centroid Calculated
    [xcm, ycm] = computeCentroid(inputMatrix, pixelArea);
    
    %Mments of inertia about the origin calculated
    [Ixx_origin, Iyy_origin, Ixy_origin] = computeMomentsAboutOrigin(inputMatrix, pixelArea);
    
    %Total Area Calculated 
    area = computeArea(inputMatrix, pixelArea);
    
    %Parallel-axis theorem applied
    Ixx_cent = Ixx_origin - area * ycm^2;
    Iyy_cent = Iyy_origin - area * xcm^2;
    Ixy_cent = Ixy_origin - area * xcm * ycm;
end