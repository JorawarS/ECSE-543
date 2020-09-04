function max_res = max_residual_final(mesh,h)%calculate maximum of all the residuals at the free nodes

s_cable=0.1;
core_l=0.04;
core_h=0.02;
xmax = round((s_cable/h)+1);
ymax = round((s_cable/h)+1);
max_res=0;
for i=2:ymax
    for j=2:xmax
        if i< (ymax-(core_h/h)) || j< (xmax-(core_l/h))
            if  j==xmax   %Neuman boundary
                res = 2*mesh(i,j-1)+mesh(i-1,j)+mesh(i+1,j)-4*mesh(i,j);
                res = abs(res);
            elseif  i==ymax %Neuman boundary
                res = mesh(i,j-1)+mesh(i,j+1)+2*mesh(i-1,j)-4*mesh(i,j);
                res = abs(res);
            else
                res = mesh(i,j-1)+mesh(i,j+1)+mesh(i-1,j)+mesh(i+1,j)-4*mesh(i,j);
                res = abs(res);
            end
            
            if res > max_res
                max_res = res;
            end
        end
    end
end

end

