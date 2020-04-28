function [posXtomove , posYtomove] = mapping(c,currentPosx, currentPosy)
    if c == 1
        posXtomove = currentPosx - 1;
        posYtomove = currentPosy - 1;
     end
     if c == 2
        posXtomove = currentPosx - 1;
        posYtomove = currentPosy;
     end
     if c == 3
        posXtomove = currentPosx - 1;
        posYtomove = currentPosy + 1;
     end
     if c == 4
        posXtomove = currentPosx;
        posYtomove = currentPosy - 1; 
     end
     if c == 5
        posXtomove = currentPosx;
        posYtomove = currentPosy; 
     end
     if c == 6
        posXtomove = currentPosx;
        posYtomove = currentPosy + 1;
     end
     if c == 7
        posXtomove = currentPosx + 1;
        posYtomove = currentPosy - 1;
     end
     if c == 8
        posXtomove = currentPosx + 1;
        posYtomove = currentPosy;
     end
     if c == 9
        posXtomove = currentPosx + 1;
        posYtomove = currentPosy + 1;
     end
end