function At = mat_trans(A)
%function to transpose a matrix

[n,m]=size(A);
for i=1:n
    for j=1:m
        At(j,i)=A(i,j);
    end
end
end

