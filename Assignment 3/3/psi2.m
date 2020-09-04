function psi = psi2(V1,V2)
%evaluate second non linear equation
global  Isa Isb kt
psi= Isa*(exp((V1-V2)/kt)-1) - Isb*(exp(V2/kt)-1);
end


