function heading = heading_from_cubic(cubic_coeff,index, pathX)
    % Find the slope vector at target wp
    if(index == length(pathX))
        % If the reference index is at the last point of the path
        
        % We will take the heading same as the second to last point as
        % there is no next point to reference to relative to the last 
        % target waypoint in the path.
        current_pos_y = cubic_coeff(1)*pathX(index-1)^3+...
                        cubic_coeff(2)*pathX(index-1)^2+...
                        cubic_coeff(3)*pathX(index-1)+...
                        cubic_coeff(4);
        look_ahead_y = cubic_coeff(1)*pathX(index)^3+...
                       cubic_coeff(2)*pathX(index)^2+...
                       cubic_coeff(3)*pathX(index)+...
                       cubic_coeff(4);
        heading = atan2(look_ahead_y - current_pos_y, pathX(index) - pathX(index-1));
    else
        current_pos_y = cubic_coeff(1)*pathX(index)^3+...
                        cubic_coeff(2)*pathX(index)^2+...
                        cubic_coeff(3)*pathX(index)+...
                        cubic_coeff(4);
        look_ahead_y = cubic_coeff(1)*pathX(index+1)^3+...
                       cubic_coeff(2)*pathX(index+1)^2+...
                       cubic_coeff(3)*pathX(index+1)+...
                       cubic_coeff(4);    
        heading = atan2(look_ahead_y - current_pos_y, pathX(index+1) - pathX(index));
    end
end

