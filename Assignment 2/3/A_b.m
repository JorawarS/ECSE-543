%generate the matrices A and b for the matrix equation
clear()
for i=1:19%initialise the matrices
    for j=1:19
        A(i,j)=0;
        b(i,1)=0;
    end
end

for i=1:19%fill the matrix according to location of node
    A(i,i)=-4;
    if i==1
        A(i,i+1)=1;
        A(i,i+5)=1;
    elseif i==2 || i==3 || i==4
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+5)=1;
    elseif i==5
        A(i,i-1)=2;
        A(i,i+5)=1;
    elseif i==6 || i==11
        A(i,i+1)=1;
        A(i,i-5)=1;
        A(i,i+5)=1;
    elseif i==13 || i==14
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i-5)=1;
        b(i,1)=-15;
    elseif i==10
        A(i,i-1)=2;
        A(i,i-5)=1;
        A(i,i+5)=1;
    elseif i==15
        A(i,i-1)=2;
        A(i,i-5)=1;
        b(i,1)=-15;
    elseif i==16
        A(i,i+1)=1;
        A(i,i+2)=1;
        A(i,i-5)=1;
    elseif i==17
        A(i,i-1)=1;
        A(i,i-5)=1;
        A(i,i+2)=1;
        b(i,1)=-15;
    elseif i==18
        A(i,i+1)=1;
        A(i,i-2)=2;
    elseif i==19
        A(i,i-2)=2;
        A(i,i-1)=1;
        b(i,1)=-15;
    else
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+5)=1;
        A(i,i-5)=1;
    end
end

        
        
        
        