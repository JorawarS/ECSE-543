function [A,Y,J,E] = read_data(filename,node,branch)
%reads circuit data from file 
M=importdata(filename);
for i=1:node
    for j=1:branch
        A(i,j)=M(i,j);
    end
end
for i=1:branch
    J(i,1)=M(i,j+2);
    R(i,1)=M(i,j+3);
    E(i,1)=M(i,j+4);
end
for i=1:branch
    for j=1:branch
        if i==j
            Y(i,j)=1/R(i,1);
        else
            Y(i,j)=0;
        end
    end
end
end