%test Bench for Q3 to apply SOR and Jacobi methods for uniform node spacing
clear()
h=[0.02,0.01,0.005,0.002,0.001,0.0005];
w=linspace(1.1,1.9,10);
A=mesh_cable_final(h(1));
%SOR method for different values of w at h=0.02
for i=1:10
    [phi,itr1(i)]=SOR_final(A,w(i),h(1));
    V(i)=get_potential(0.06,0.04,phi,h(1));
end
% Plot iterations vs w for SOR method
figure(1)
plot(w,itr1,'-o')
xlabel('omega') 
ylabel('Iterations')
grid

for i=1:6 %SOR method for different values of h at optimal w=1.35
    A=mesh_cable_final(h(i));
    [phi,itr2(i)]=SOR_final(A,1.35,h(i));
    V1(i)=get_potential(0.06,0.04,phi,h(i));
end

for i=1:6%Jacobi method for different values of h at optimal w=1.35
    A=mesh_cable_final(h(i));
    [phi,itr3(i)]=Jacobi_final(A,h(i));
    V2(i)=get_potential(0.06,0.04,phi,h(i));
end
% Plot potential at (0.06,0.04) vs 1/h for SOR and Jacobi method
figure(2)
plot(1./h,V1,1./h,V2,'--')
xlabel('1/h') 
ylabel('V')
grid
% Plot iterations vs 1/h for SOR and Jacobi method
figure(3)
plot(1./h,itr2,1./h,itr3,'--')
xlabel('1/h') 
ylabel('iterations')
grid


    