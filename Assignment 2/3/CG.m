function x = CG(A,b)
%Conjugate Gradient method to solve Ax=b
n=length(b);
for i=1:n
x(i,1)=0;%initial guess
end
r=mat_sub(b,mat_mul(A,x));
p=r;
norm_2(1)=sqrt(mat_mul(mat_trans(r),r));
norm_inf(1)=0;
for i=1:n
    if abs(r(i,1))> norm_inf(1)
        norm_inf(1)=abs(r(i,1));
    end
end
itr(1)=0;
i=1;
while norm_2(i)>1e-5%iterate while 2 norm is < 1e-5 (similar to SOR)
    alpha = mat_mul(mat_trans(p),r)/mat_mul(mat_trans(p),mat_mul(A,p));
    x = mat_sum(x,s_mul(alpha,p));
    r = mat_sub(b,mat_mul(A,x));
    beta = -mat_mul(mat_trans(p),mat_mul(A,r))/mat_mul(mat_trans(p),mat_mul(A,p));
    p = mat_sum(r,s_mul(beta,p));
    i=i+1;
    norm_2(i)=sqrt(mat_mul(mat_trans(r),r));
    norm_inf(i)=0;
    for j=1:n
        if abs(r(j,1))> norm_inf(i)
            norm_inf(i)=abs(r(j,1));
        end
    end
    itr(i)=i-1;
end
%plot 2 norm 
figure(1)
plot(itr,norm_2,'rx-')
xlabel('Iteration') 
ylabel('2 Norm of residual vector')
grid
%plot inf norm 
figure(2)
plot(itr,norm_inf,'x-')
xlabel('Iteration') 
ylabel('infinity Norm of residual vector')
grid
end

