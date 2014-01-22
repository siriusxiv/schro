function position_min=minimum(T,Y)
    position_min=1;
    for i=2:size(T,1)
        if Y(position_min)>Y(i)
            position_min=i;
        end
    end