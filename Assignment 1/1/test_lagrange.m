%Script to call the lagrange function and plot the interpolated data 
B1=[0;0.2;0.4;0.6;0.8;1.0];
H1=[0;14.7;36.5;71.7;121.4;197.4];
n=6;
i=1;
for b=0:(1.9/100):1.9
    h(i,1)=Lagrange(b,H1,B1,n);
    i=i+1;    
end
figure(1)
    plot(h,0:(1.9/100):1.9);
    legend("interpolated curve")
    hold on
    plot(H1, B1, 'or')
    legend("interpolated curve", "data points")
    title('Lagrange Polynomial Interpolation')  
    hold off
    xlabel('H(A/m)') 
    ylabel('B(T)')
    grid 
    
B2=[0;1.3;1.4;1.7;1.8;1.9];
H2=[0;540.6;1062.8;8687.4;13924.3;22650.2];
n=6;
i=1;
for b=0:(1.9/100):1.9
    h(i,1)=Lagrange(b,H2,B2,n);
    i=i+1;    
end
figure(2)
    plot(h,0:(1.9/100):1.9);
    legend("interpolated curve")
    hold on
    plot(H2, B2, 'or')
    legend("interpolated curve", "data points")
    title('Lagrange Polynomial Interpolation')  
    hold off
    xlabel('H (A/m)') 
    ylabel('B (T)')
    grid 