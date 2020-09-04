function A = mesh_nu(x,y)
%Create the grid of nodes for non uniform node spacing
%Using symmetry along x and y axis , consider only one quarter of the
%area(bottom left)
pot=15;
s_cable=0.1;
for i=1:length(y)
    for j=1:length(x)
        if x(j)>s_cable || y(i)>s_cable
            disp('out of bounds');
            A=nan;
        else
            if x(j)>=0.06 && y(i)>=0.08%apply dirichlet boundary conditions
                mesh(i,j)=pot;
            else
                mesh(i,j)=0;
            end
        end
    end
end
A=mesh;
end