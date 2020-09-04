function max_res = max_residual_nu(mesh,x,y)
%calculate maximum of all the residuals at the free nodes for the non
%uniform node spacing

for i=2:length(x)
    hx(i-1)=x(i)-x(i-1);
end
for i=2:length(y)
    hy(i-1)=y(i)-y(i-1);
end
max_res=0;
for i=2:length(y)
    for j=2:length(x)
        if x(j)< 0.06 || y(i)< 0.08
            if j==length(x) %Neuman boundary
                alpha= 1/(hx(j-1)^2) + 1/(hy(i-1)*(hy(i)+hy(i-1))) + 1/(hy(i)*(hy(i)+hy(i-1)));
                res=(mesh(i,j-1)/(hx(j-1)^2) + mesh(i-1,j)/(hy(i-1)*(hy(i)+hy(i-1))) + mesh(i+1,j)/(hy(i)*(hy(i)+hy(i-1))))-(alpha*mesh(i,j));
                res = abs(res);
            elseif  i==length(y) %Neuman boundary
                alpha= 1/(hx(j-1)*(hx(j)+hx(j-1))) + 1/(hx(j)*(hx(j)+hx(j-1))) + 1/(hy(i-1)^2);
                res = (mesh(i,j-1)/(hx(j-1)*(hx(j)+hx(j-1))) + mesh(i,j+1)/(hx(j)*(hx(j)+hx(j-1))) + mesh(i-1,j)/(hy(i-1)^2))-(alpha*mesh(i,j));
                res = abs(res);
            else
                alpha= 1/(hx(j-1)*(hx(j)+hx(j-1))) + 1/(hx(j)*(hx(j)+hx(j-1))) + 1/(hy(i-1)*(hy(i)+hy(i-1))) + 1/(hy(i)*(hy(i)+hy(i-1)));
                res = (mesh(i,j-1)/(hx(j-1)*(hx(j)+hx(j-1))) + mesh(i,j+1)/(hx(j)*(hx(j)+hx(j-1))) + mesh(i-1,j)/(hy(i-1)*(hy(i)+hy(i-1))) + mesh(i+1,j)/(hy(i)*(hy(i)+hy(i-1))))-(alpha*mesh(i,j));
                res = abs(res);
            end
            
            if res > max_res
                max_res = res;
            end
        end
    end
end

end


