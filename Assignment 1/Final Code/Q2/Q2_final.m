%Test bench to solve the circuit mesh using both methods(sparse optimised and
%unoptimised) and compare computation time

clear()
% Solve for n=2,3,4....,10 with the normal unoptimized method
for n = 2:10
	[A, Y, J, E] = mesh_final(n);
	t_start=tic;%start timer
	V = solve(A, Y, J, E,'n');
	t_normal(n-1) = toc(t_start);%stop timer to measure computation time 
    R=V(1);
	r(n-1) = R;
end
clearvars -except t_normal

% Solve for n=2,3,4....,10 with the optimized method
for n = 2:10
	[A, Y, J, E] = mesh_final(n);
	t_start=tic;%start timer
	V = solve(A, Y, J, E,'o');
	t_optimised(n-1) = toc(t_start);%stop timer to measure computation time 
    R=V(1);
	r(n-1) = R;
end

%Plotting R versus N:
x = 2:10;
plot(x,r)
xlabel('N') 
ylabel('Resistance(ohms)')
grid

% Plot unoptimized and sparse optimized computation time graphs
figure(2)
plot(x,t_normal,'o')
xlabel('N') 
ylabel('Computation Time') 
hold on
plot(x,t_optimised, '*')
grid