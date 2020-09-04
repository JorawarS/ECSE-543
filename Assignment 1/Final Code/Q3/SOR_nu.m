function [phi,itr] = SOR_nu(mesh,w,x,y) 
%function which performs successive over relaxation and gives final scaler
%potential and returns the number of iterations

for i=2:length(x)
    hx(i-1)=x(i)-x(i-1);
end
for i=2:length(y)
    hy(i-1)=y(i)-y(i-1);
end
r=max_residual_nu(mesh,x,y);
itr=0;
A=mesh;
while r>1e-5
    for i=2:length(y)
        for j=2:length(x)
            if x(j)< 0.06 || y(i)< 0.08
                if j==length(x) %Neuman boundary
                    alpha= 1/(hx(j-1)^2) + 1/(hy(i-1)*(hy(i)+hy(i-1))) + 1/(hy(i)*(hy(i)+hy(i-1)));
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/alpha)*(mesh(i,j-1)/(2*(hx(j-1)^2)) + A(i,j-1)/(2*(hx(j-1)^2)) + mesh(i-1,j)/(hy(i-1)*(hy(i)+hy(i-1))) + mesh(i+1,j)/(hy(i)*(hy(i)+hy(i-1))));
                elseif i==length(y) %Neuman boundary
                    alpha= 1/(hx(j-1)*(hx(j)+hx(j-1))) + 1/(hx(j)*(hx(j)+hx(j-1))) + 1/(hy(i-1)^2);
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/alpha)*(mesh(i,j-1)/(hx(j-1)*(hx(j)+hx(j-1))) + mesh(i,j+1)/(hx(j)*(hx(j)+hx(j-1))) + mesh(i-1,j)/(2*(hy(i-1)^2)) + A(i-1,j)/(2*(hy(i-1)^2)));
                else %update mesh using SOR formula 
                    alpha= 1/(hx(j-1)*(hx(j)+hx(j-1))) + 1/(hx(j)*(hx(j)+hx(j-1))) + 1/(hy(i-1)*(hy(i)+hy(i-1))) + 1/(hy(i)*(hy(i)+hy(i-1)));
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/alpha)*(mesh(i,j-1)/(hx(j-1)*(hx(j)+hx(j-1))) + mesh(i,j+1)/(hx(j)*(hx(j)+hx(j-1))) + mesh(i-1,j)/(hy(i-1)*(hy(i)+hy(i-1))) + mesh(i+1,j)/(hy(i)*(hy(i)+hy(i-1))));
                end
            end
        end
    end
    A=mesh;
    itr=itr+1;
    r=max_residual_nu(mesh,x,y);
end
    phi=mesh;
end



