function A = mesh_cable_final(h) %Create the grid of nodes 
%Using symmetry along x and y axis , consider only one quarter of the area(bottom left)
pot=15;
s_cable=0.1;
core_l=0.04;
core_h=0.02;
xmax = round((s_cable/h)+1);
ymax = round((s_cable/h)+1);

for i=1:ymax %apply dirichlet boundary conditions and initialise every free node = 0
    for j=1:xmax
         if i>= (ymax-(core_h/h)) && j>= (xmax-(core_l/h))
             mesh(i,j) = pot;
         else
             mesh(i,j) = 0;
         end
    end
end
A = mesh;     
end



