function [A,Y,J,E] = mesh1(n)
%function to create the input data for a N*2N finite difference mesh
node_total=(2*n)*(n);
branch_total=(4*n-3)*n;

%initialize incidence matrix
for i= 1:node_total 
    for j=1:branch_total+1
        M(i,j)=0;
    end
end

%populate incidence matrix
for i=1:n 
    for j=1:2*n
        node_pos= 2*n*(i-1)+j;
        br_right= node_pos+(2*n-1)*(i-1);
        br_up= br_right+(2*n-1);
        br_down= br_right-2*n;
        br_left=br_right-1;
        if i==1
            if j==1
                M(node_pos,br_right)=1;
                M(node_pos,br_up)=1;
            elseif j==2*n
                M(node_pos,br_up)=1;
                M(node_pos,br_left)=-1;
            else
                M(node_pos,br_right)=1;
                M(node_pos,br_left)=-1;
                M(node_pos,br_up)=1;
            end
                
        elseif i==n
            if j==1
                M(node_pos,br_right)=1;
                M(node_pos,br_down)=-1;
            elseif j==2*n
                M(node_pos,br_down)=-1;
                M(node_pos,br_left)=-1;
            else
                M(node_pos,br_right)=1;
                M(node_pos,br_left)=-1;
                M(node_pos,br_down)=-1;
            end
                
        else
            if j==1
                M(node_pos,br_right)=1;
                M(node_pos,br_up)=1;
                M(node_pos,br_down)=-1;
            elseif j==2*n
                M(node_pos,br_up)=1;
                M(node_pos,br_left)=-1;
                M(node_pos,br_down)=-1;
            else
                M(node_pos,br_right)=1;
                M(node_pos,br_left)=-1;
                M(node_pos,br_up)=1;
                M(node_pos,br_down)=-1;
            end
        end        
    end
end

%Add an extra branch between the the corner nodes with voltage source=1V
%and resistance =1 ohm 
M(1,branch_total+1)=-1;
M(node_total,branch_total+1)=1;

%Create the reduced incidence matrix by grounding the last node
for i= 1:node_total-1
    for j=1:branch_total+1
        A(i,j)=M(i,j);
    end
end

%create the diagonal matrix Y with elements 1/R on the diagonal
for i=1:branch_total+1
    for j=1:branch_total+1
        if i==j
            if j~=branch_total+1
                Y(i,j)=1e-3;
            else
                Y(i,j)=1;
            end
        else
            Y(i,j)=0;
        end
    end
end

%create E vector
for i=1:branch_total+1
    if i<branch_total+1
        E(i,1)=0;
    else
        E(i,1)=1;
    end
end

%create an empty J vector since we dont have any current sources
for i=1:branch_total+1  
        J(i,1)=0;
end

end


