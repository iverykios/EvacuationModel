clear;
clc;
close all;

%% Initialization Parameters

timesteps = 300 ; % define the time of the simulation

gridsize = 120 ; % CA grid per dimension

population = 100 ; % number of people in the room to evacuate

%% Initializing CA grid
% CA contains info about the places of people,fire,exit and empty positions
% in grid
[exitIndex ,people,CA] = initializeCA(gridsize, population);
%% Crowd evacuation process model
 title('Simulation Result')
 hold on;
 pause(1);
 
 for t=1:timesteps
    [nextCA,p] = evacuationRule(exitIndex, people,CA);
    people = p;
    CA = nextCA;
    imagesc(CA);
    pause(.1);
    if isempty(find(CA==2)~=0)
        fprintf("Evacuation process came to an end after %d time steps.\n",t);
        hold off;
        break;
    end
 end
if t>=timesteps && ~(isempty(find(CA==2)~=0))~=0
    disp("Time steps used were not sufficient")
end
