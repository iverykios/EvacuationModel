function [CA,particle] = evacuationRule(exit, people,C)  
    % distmatrix declares the distances matrix from every exit and Moore neighberhood
    % calculation distace for every cell in neighberhood we use Euclidean
    % distance
    for i=1:length(people)
        x = people(i).currentPosx;
        y = people(i).currentPosy;
        if people(i).inRoom == false
            people(i).distmatrix = distFromExit(exit(1:exit(end,1),:), x,y,C(x-1:x+1,y-1:y+1)); %(x-1:x+1,y-1:y+1)
        else
            people(i).distmatrix = distFromExit(exit(exit(end,1)+1:end-1,:), x,y,C(x-1:x+1,y-1:y+1)); %(x-1:x+1,y-1:y+1)
        end
        [r,c] = minimum(people(i).distmatrix ); % calculating the index of minimum distance from exit
        people(i).nearestExit = r;
        [people(i).posXtomove, people(i).posYtomove] = mapping(c, people(i).currentPosx, people(i).currentPosy);
    end   
%% Route Planning Apply CA evacuation rule
    for i=1:length(people)
        if C(people(i).posXtomove,people(i).posYtomove) ~= 0
            if C(people(i).posXtomove,people(i).posYtomove) == 2 % minimun cell occupied particle stays immovable
                people(i).posXtomove = people(i).currentPosx;
                people(i).posYtomove = people(i).currentPosy;
            end
        end
        if (C(people(i).posXtomove,people(i).posYtomove) == 0 || C(people(i).posXtomove,people(i).posYtomove)==3 )  % checks if cell to move is empty or next cell to move is exit     
        for j=1:length(people) 
            if(people(i).nearestExit==people(j).nearestExit && people(i).posXtomove==people(j).posXtomove && people(i).posYtomove==people(j).posYtomove && i~=j)
                if people(i).distmatrix(people(i).nearestExit,5)>people(j).distmatrix(people(i).nearestExit,5) % fronts the exit  
                    people(i).posXtomove = people(i).currentPosx;
                    people(i).posYtomove = people(i).currentPosy;
                else
                   
                   people(j).posXtomove = people(j).currentPosx;
                   people(j).posYtomove = people(j).currentPosy;
                end
            end
        end
        end
    end
    %% Room Evacuation
    for i=1:length(people)
        if people(i).posXtomove==exit(5,1) && people(i).posYtomove==exit(5,2)
            people(i).inRoom = false;
        end
    end
    %%
    [CA, particle] = updateCA(people,C);
    particle(([particle.ReachedTheExit] == true)) = []; % discard those who reached te exit
end