%Function to interpolate using lagrange Polyomials
function L=Lagrange(x,H,B,n)
L=0;
for i=1:n
    L=L+H(i)*lagrange_f(x,i,B,n);
end
%Function to calculate lagrange Polyomials
function L=lagrange_f(x,i,B,n)
L=1;
for k=1:n
    if k==i
       continue;
    end
    L=((x-B(k))/(B(i)-B(k)))*L;
end

