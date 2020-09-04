function M = mat_mul(A,B)%function to multiply two matrices
[n1,m1]=size(A);
[n2,m2]=size(B);
    if m1~=n2
        disp('size mismatch');
        M=nan;
        return;
    else
        for i=1:n1
            for j=1:m2
                M(i,j)=0;
                for t=1:m1
                    M(i,j)=M(i,j)+ A(i,t)*B(t,j);
                end    
            end
        end
    end   
end

