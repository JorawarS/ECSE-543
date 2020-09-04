%OPTIMISED METHOD TEST BENCH



% Solve for n=2,3,4....,10 with the optimized method
for n = 2:10
	[A, Y, J, E] = mesh3(n);
	t_start=tic;%start timer
	V = solve(A, Y, J, E,'o');
	t_optimised(n-1) = toc(t_start);%stop timer to measure computation time 
    R=V(1);%R = V(1) / (1.00 - V(1));
	r(n-1) = R;
end


%Plotting R versus N:
x = 2:10;
plot(x,r)
xlabel('N') 
ylabel('Resistance(ohms)')
grid
%hold on