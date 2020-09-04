function V = get_potential(x,y,phi,h)%to find potential at any point (x,y) accross entire cable
    if x<=0.1
        if y<=0.1
            V=phi(round(y/h+1),round(x/h+1));
        elseif y>0.1 && y<=0.2
            V=phi(round((0.2-y)/h+1),round(x/h+1));
        else
            disp('given coordinate doesnt exist on the cable');
            V=nan;
        end
    
    elseif x>0.1 && x<=0.2
        if y<=0.1
            V=phi(round(y/h+1),round((0.2-x)/h+1));
        elseif y>0.1 && y<=0.2
            V=phi(round((0.2-y)/h+1),round((0.2-x)/h+1));
        else
            disp('given coordinate doesnt exist on the cable');
            V=nan;
        end
        
    else
        disp('given coordinate doesnt exist on the cable');
            V=nan;
    end

end

