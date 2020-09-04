function J = jacobian(V1,V2)
global  R Isa Isb kt
%function to calculate the jacobian
  J(1,1) = 1.0 + (R * Isa / kt) * (exp((V1 - V2) / kt));
  J(1,2) = -1.0 * (R * Isa / kt) * (exp((V1 - V2) / kt));
  J(2,1) = (Isa / kt) * (exp((V1 - V2) / kt));
  J(2,2) = -1.0 * (Isa / kt) * (exp((V1 - V2) / kt)) - (Isb / kt) * (exp(V2 / kt));
end

