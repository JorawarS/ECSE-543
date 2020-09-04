 function [L,U,x] = Cholesky(A,b)
%%Function to solve Ax=b using Choleski algorithm :takes A,b as input
    n=size(A,1);
    for j=1:n %to decompose A into L and transpose of L (= U)
        for i=1:n
            temp_sum=0;
            if(i<j)
                L(i,j)=0;
                U(j,i)=0;
            elseif(i==j)
                for m = 1:j-1
                    temp_sum = temp_sum + (L(j,m)^2);
                end
                L(j,j)= sqrt(A(j,j)-temp_sum);
                U(j,j)=L(j,j);   
            else
                for m= 1:j-1
                    temp_sum = temp_sum + (L(i,m)*L(j,m));
                end
                L(i,j)= (A(i,j)-temp_sum)/L(j,j);
                U(j,i)=L(i,j);
            end   
        end
    end

    for i=1:n %FORWARD ELIMINATION(Put Ux=y and solve Ly=b for y)
        temp_sum=0;
        for j=1:i-1
            temp_sum = temp_sum + L(i,j)*y(j,1);
        end
        y(i,1) = (b(i,1)-temp_sum)/L(i,i);
    end
    for i=n:-1:1%BACKWARD ELIMINATION(solve Ux=y for x)
        temp_sum=0;
        for j=n:-1:i+1
            temp_sum = temp_sum + U(i,j)*x(j,1);
        end
        x(i,1) = (y(i,1)-temp_sum)/U(i,i);
    end        
end

