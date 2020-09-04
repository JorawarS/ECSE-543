function M = s_mul(a,A)%function to multiply  matrix y a scaler
[n,m]=size(A);
for i=1:n
    for j=1:m
        A(i,j)=a*A(i,j);
    end
end
M=A;
end

