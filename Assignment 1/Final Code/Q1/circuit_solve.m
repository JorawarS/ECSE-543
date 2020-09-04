function V = circuit_solve(A,Y,J,E) %function to find voltage at the nodes of a given circuit

lhs1=mat_mul(A,Y);
lhs2=mat_trans(A);
lhs_final=mat_mul(lhs1,lhs2);%A*Y*(A^t)

rhs1=mat_mul(Y,E);
rhs2=mat_sub(J,rhs1);
rhs_final=mat_mul(A,rhs2);%A*(J-Y*E)

V=Cholesky_lookahead(lhs_final,rhs_final);%call cholesky function to solve AY(A^t)=A(J-YE)
end

