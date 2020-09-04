function V = solve(A,Y,J,E,operation) %function to find voltage at the nodes of the mesh
lhs1=mat_mul(A,Y);
lhs2=mat_trans(A);
lhs_final=mat_mul(lhs1,lhs2);%A*Y*(A^t)
hbw=find_band(lhs_final);%find bandwidth of the final square matrix

rhs1=mat_mul(Y,E);
rhs2=mat_sub(J,rhs1);
rhs_final=mat_mul(A,rhs2);%A*(J-Y*E)
if operation =='n'%perform unoptimised cholesky decomposition
    V=Cholesky_lookahead(lhs_final,rhs_final);
elseif operation=='o'%perform optimised cholesky decomposition
    V=Cholesky_sparse(lhs_final,rhs_final,hbw);
end

end

 