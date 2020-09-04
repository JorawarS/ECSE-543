%Create the input file for the SIMPLE2D program.
clear()
f= fopen('input_file.dat','w');
for i=1:6 %create 1st section of file: position of each node
    for j=1:6
        node_pos=j+6*(i-1);
        x=(j-1)*0.02;
        y=(i-1)*0.02;
        if node_pos<35
            fprintf(f, '%5d %5.2f %5.2f \n', node_pos, x, y);
        end
    end
end

fprintf(f,'\n');%add a blank row

for i=1:5 %create 2nd section of file: form triangular elements from the nodes
    for j=1:5
       node_pos=j+6*(i-1);
       if node_pos<28
            fprintf(f, '%5d %5d %5d %5.2f \n', node_pos,node_pos+1 , node_pos+6 , 0);
            fprintf(f, '%5d %5d %5d %5.2f \n', node_pos+1,node_pos+7 , node_pos+6 , 0);
       end
    end
end

fprintf(f,'\n');%add a blank row

for i=1:6%create 3rd section of file: specifiy prescribed nodes on dirichlet boundaries
    for j=1:6
        node_pos=j+6*(i-1);
        if i==1 || j==1
            fprintf(f,'%5d %5.2f \n', node_pos,0);
        elseif node_pos==28 || node_pos==29 || node_pos==30 || node_pos==34
            fprintf(f,'%5d %5.2f \n', node_pos,15);
        end
            
    end
end        
fclose(f);

