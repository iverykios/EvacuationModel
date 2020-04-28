function [r,c] = minimum(distance)
    min = 1/eps;
    [x,y] = size(distance);
    for i=1:x
        for j=1:y
            if min > distance(i,j)
                min = distance(i,j);
                r = i;
                c = j;
            end
        end
    end
end