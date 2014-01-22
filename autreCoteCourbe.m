function positionAutreCote=autreCoteCourbe(position_min,positionCeCote,Y)
    positionAutreCote=-1;
    i=position_min;
    while i<=size(Y,1)
        if Y(positionCeCote)<Y(i)
            positionAutreCote=i;
            break;
        end
        i=i-1;
    end