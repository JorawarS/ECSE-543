function x = Cholesky_lookahead(A,b)
%Choleski decomposition with look ahead modification
[n,m]=size(A);

%Check whether input matrix is a square matrix
if n~=m
    x=nan;
    disp('not a square matrix');
    return  
end
    
%to overwrite A by L and b by y
for j=1:n
    A(j,j)=sqrt(A(j,j));
    b(j,1)=b(j,1)/A(j,j);
    for i= j+1:n
        A(i,j)=A(i,j)/A(j,j);
        b(i)= b(i)-A(i,j)*b(j);
        for k=j+1:i
            A(i,k)=A(i,k)-A(i,j)*A(k,j);
        end
    end
end
U=mat_trans(A);%transpose the edited matrix A to get U

for i=n:-1:1%BACKWARD ELIMINATION(solve Ux=y for x)
        temp_sum=0;
        for j=n:-1:i+1
            temp_sum = temp_sum + U(i,j)*x(j,1);
        end
        x(i,1) = (b(i,1)-temp_sum)/U(i,i);   

end
end

