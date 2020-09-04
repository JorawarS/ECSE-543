function A = mat_sub(B,C)
%function to subtract two matrices
[n1,m1]=size(B);
[n2,m2]=size(C);
if m1==m2 && n1==n2
    for i=1:n1
        for j=1:m1
            A(i,j)=B(i,j)-C(i,j);
        end
    end
else
    disp('matrices are not the same size');
    A=nan;
    return;
end
end


