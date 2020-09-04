function psi = psi1(V1,V2)
%evaluate first non linear equation
global E R Isa kt
psi=V1-E + R*Isa*(exp((V1-V2)/kt)-1);
end

