function [distmatrix] = distFromExit(exit, Posx, Posy,CA)
[numofExits, ~] = size(exit); % find the number of exits
distmatrix = zeros(numofExits,9);
distmatrix(1:numofExits,1:9) = 1/eps;
    for j=1:numofExits
        if CA(1,1) ~= 4 
            distmatrix(j,1) = sqrt(((Posx-1)-exit(j,1))^2 + ((Posy-1)-exit(j,2))^2); % i-1,j-1 from exit
        end
        if CA(1,2) ~= 4 
            distmatrix(j,2) = sqrt(((Posx-1)-exit(j,1))^2 + ((Posy)-exit(j,2))^2); % i-1,j from exit
        end
        if CA(1,3) ~= 4 
            distmatrix(j,3) = sqrt(((Posx-1)-exit(j,1))^2 + ((Posy+1)-exit(j,2))^2); % i-1,j+1 from exit
        end
        if CA(2,1) ~= 4  
            distmatrix(j,4) = sqrt((Posx-exit(j,1))^2 + ((Posy-1)-exit(j,2))^2); % i,j-1 from exit
        end
        if CA(2,2) ~= 4  
            distmatrix(j,5) = sqrt((Posx-exit(j,1))^2 + (Posy-exit(j,2))^2); % i,j from exit
        end
        if CA(2,3) ~= 4 
            distmatrix(j,6) = sqrt((Posx-exit(j,1))^2 + ((Posy+1)-exit(j,2))^2); % i,j+1 from exit
        end
        if CA(3,1) ~= 4 
            distmatrix(j,7) = sqrt(((Posx+1)-exit(j,1))^2 + ((Posy-1)-exit(j,2))^2); % i+1,j-1 from exit
        end
        if CA(3,2) ~= 4 
            distmatrix(j,8) = sqrt(((Posx+1)-exit(j,1))^2 + (Posy-exit(j,2))^2); % i+1,j from exit
        end
        if CA(3,3) ~= 4 
            distmatrix(j,9) = sqrt(((Posx+1)-exit(j,1))^2 + ((Posy+11)-exit(j,2))^2); % i+1,j+1 from exit  
        end
    end
end