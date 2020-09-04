function [phi,itr] = SOR_final(mesh,w,h)
%function which performs successive over relaxation and gives final scaler
%potential and returns the number of iterations
s_cable=0.1;
core_l=0.04;
core_h=0.02;
xmax = round((s_cable/h)+1);
ymax = round((s_cable/h)+1);
r=max_residual_final(mesh,h);
itr=0;
A=mesh;
while r>1e-5
    for i=2:ymax
        for j=2:xmax
            if i< (ymax-(core_h/h)) || j< (xmax-(core_l/h))
                if  j==xmax   %Neuman boundary
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/4)*(mesh(i,j-1)+A(i,j-1)+mesh(i-1,j)+mesh(i+1,j));
                elseif i==ymax %Neuman boundary
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/4)*(mesh(i,j-1)+mesh(i,j+1)+mesh(i-1,j)+A(i-1,j));
                else             %update mesh using SOR formula  
                    mesh(i,j) = (1-w)*mesh(i,j)+(w/4)*(mesh(i,j-1)+mesh(i,j+1)+mesh(i-1,j)+mesh(i+1,j));
                end
            end
        end
    end
    A=mesh;
    itr=itr+1;
    r=max_residual_final(mesh,h);
end
    phi=mesh;
end



