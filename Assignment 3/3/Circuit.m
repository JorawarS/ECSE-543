%script to solve the non linear equations for the circuit
global E R Isa Isb kt
V1 =  0;
V2 = 0;
E = 220e-3;
R = 500;
Isa =0.6e-6;
Isb = 1.2e-6;
kt = 25e-3;
i=0;
err=1e-6;
V=[V1;V2];
V_d=[V1-V2;V2];
V_diode=V_d;%variable to store value of voltage accross each diode in each iteration
Vstore=V;%variable to store value of V1 and V2 in each iteration
p1=psi1(V1,V2);
p2=psi2(V1,V2);
psi=[p1;p2];
psi_store=[p1;p2];%variable to store value of NL functions in each iteration
while sqrt(p1^2 + p2^2)> err 
   %(abs(p1) + abs(p2)) / ( abs(psi1(0,0)) + abs(psi2(0,0)) ) > err 
    i = i + 1;
    itr(i,1)=i;
    e(i,1)=sqrt(p1^2 + p2^2);
    V = mat_sub(V,mat_mul(mat_inv(jacobian(V1,V2)),psi));
    V1=V(1);
    V2=V(2);
    V_d(1)=V1-V2;
    V_d(2)=V2;
    Vstore=[Vstore V];
    V_diode=[V_diode V_d];
    p1=psi1(V1,V2);
    p2=psi2(V1,V2);
    psi=[p1;p2];
    psi_store= [psi_store psi];
end
plot(itr,e)
title('2norm of residual vs iteration ')  
xlabel('iteration number') 
ylabel('2 norm of residual')
grid 