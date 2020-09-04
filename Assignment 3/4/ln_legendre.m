%script to integrate ln(x) between 0 and 1
integral(1:20,1)=0;
error(1:20,1)=0;
k=1;
logN(1:20,1)=0;
logE(1:20,1)=0;
for i=10:10:200
    pts=linspace(0,1,i+1);
    for j=1:i
        integral(k)= integral(k)+ ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*sqrt(3))) + ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*-sqrt(3)));
    end 
    error(k)=abs(-1 - integral(k));
    logN(k)=log10(i);
    logE(k)=log10(error(k));
    k=k+1;
end
plot (logN,logE)
title('Log(E) vs Log(N) for ln(x)')  
hold off
xlabel('Log(N), N = number of segments ') 
ylabel('log(E), E=absolute error of the integral')
grid 