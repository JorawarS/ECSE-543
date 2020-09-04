function A = sym_posdef_gen(n)
%function to create a symmetric positive definite matrix of size n
%If M is any n x n, real, non-singular matrix then,A=MM^t is symmetric positive definite.
    for i=1:n
        for j=1:n
            if i>=j
                P(i,j)=rand()+1;%a lower trianglular matrix is non singular if all diagonal elements are non zero
                Pt(j,i)=P(i,j);
            else
                P(i,j)=0;
                Pt(j,i)=P(i,j);
            end
        end
    end
A=mat_mul(P,Pt);
end

