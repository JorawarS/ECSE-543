% Plot unoptimized and sparse optimized computation time graphs
figure(2)
plot(x,t_normal,'o')
xlabel('N') 
ylabel('Computation Time') 
hold on
plot(x,t_optimised, 'x')
grid