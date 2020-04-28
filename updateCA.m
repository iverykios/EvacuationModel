function [CAstate,people] = updateCA(people,CAstate)
% M refers to CA grid matrix that coulb be either for moving(CA) or fire(s)
for i=1:length(people)
    if CAstate(people(i).posXtomove,people(i).posYtomove)==3
        CAstate(people(i).currentPosx,people(i).currentPosy) = 0;
        people(i).ReachedTheExit = true;
    elseif CAstate(people(i).posXtomove,people(i).posYtomove)==2
        people(i).currentPosx = people(i).currentPosx;
        people(i).currentPosy = people(i).currentPosy;
    else
        CAstate(people(i).posXtomove,people(i).posYtomove) = 2;
        CAstate(people(i).currentPosx,people(i).currentPosy) = 0;
        people(i).currentPosx = people(i).posXtomove;
        people(i).currentPosy = people(i).posYtomove;
    end
    if people(i).distmatrix(people(i).nearestExit,5)==1 && people(i).ReachedTheExit==false
        CAstate(people(i).currentPosx,people(i).currentPosy) = 0;
        people(i).ReachedTheExit = true;
    end
end