function [ exitIndex, people, CA] = initializeCA(gridsize, population ) 
    CA = zeros(gridsize,gridsize); % 0 values means that the place is empty
    CA(1,:) = 4; % imposing boundary condtions
    CA(:,1) = 4;
    CA(gridsize,:) = 4;
    CA(:,gridsize) = 4; 
    
    % room obstacle
    UpperRoomBound = gridsize-20;
    LowerRoomBound = gridsize;
    LeftRoomBound = 1;
    RightRoomBound = 20;
    CA(UpperRoomBound,LeftRoomBound:RightRoomBound)=4;
    CA(UpperRoomBound+1:UpperRoomBound,RightRoomBound) = 4;
    CA(UpperRoomBound+2:LowerRoomBound,RightRoomBound)  = 4;
    % obstacle
    
    numofExits = 4;
    numofRooms = 1;
    
    exitpoint = fix(gridsize/2); % calculate mean distance in order to impose exit position in automaton
    CA(1,exitpoint) = 3; % imposing exit position
    CA(exitpoint,gridsize) = 3;
    CA(gridsize,exitpoint) = 3;
    CA(exitpoint,1) = 3;
    exitIndex = [1 exitpoint; exitpoint gridsize;gridsize exitpoint;exitpoint 1;UpperRoomBound+1 RightRoomBound;numofExits numofRooms];
   
    
    n = 2*(population );
    nums = randi([2 gridsize-1],1,n); %randomly generate numbers for people and fire places location in automaton
    
    cnt = 1;
    people(1:population) = struct( 'ReachedTheExit', false,... % declare if the person reached the exit
                          'inRoom', false,   ... % indcates if the particle is in indoor room
                          'currentPosx', 0,  ... % declare the x position in the grid
                          'currentPosy', 0,  ... % declare the y position in the grid
                          'posXtomove',  0,  ... % declare the x position to the nearest exit
                          'posYtomove',  0,  ... % declare the y position to the nearest exit
                          'nearestExit', 0,  ... % declare the nearest exit to the certain person
                          'distmatrix', zeros(numofExits,9));
    for i=1:2:2*population
        if CA(nums(i),nums(i+1))~=4
        people(cnt).currentPosx = nums(i);% people indexes in grid
        people(cnt).currentPosy = nums(i+1);% people indexes in grid
        CA(nums(i),nums(i+1)) = 2; % imposing them to automaton
        cnt = cnt + 1;
        end
    end 
    for i=1:length(people)
        people(i).inRoom = isInRoom(UpperRoomBound,LowerRoomBound,LeftRoomBound,RightRoomBound,people(i).currentPosx,people(i).currentPosy);
    end
end