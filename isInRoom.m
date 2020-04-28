function value = isInRoom(a,b,c,d,Posx,Posy)
numofRooms = length(a);
value = false;
for i=1:numofRooms
    if Posx>=a && Posx<=b && Posy>=c && Posy<=d
        value = true;
    end
end
end