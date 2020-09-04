function A = sym_posdef_gen(n)
%function to create a symmetric positive definite matrix of size n
%If M is any n x n, real, non-singular matrix then,A=MM^t is symmetric positive definite.
    for i=1:n
        for j=1:n
            P(i,j)=rand()+1;
            Pt(j,i)=P(i,j);
        end
    end
A=mat_mul(P,Pt);
end

