%script to integrate cos(x) between 0 and 1
integral(1:20,1)=0;
error(1:20,1)=0;
logN(1:20,1)=0;
logE(1:20,1)=0;
for i=1:20
    pts=linspace(0,1,i+1);
    for j=1:i
        integral(i)= integral(i)+ ((pts(j+1)-pts(j))/2)*cos( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*sqrt(3))) + ((pts(j+1)-pts(j))/2)*cos( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*-sqrt(3)));
    end
    error(i)= abs(sin(1)-integral(i));
    logN(i)=log10(i);
    logE(i)=log10(error(i));
end
plot (logN,logE)
title('Log(E) vs Log(N) for cos(x)')  
hold off
xlabel('Log(N), N = number of segments ') 
ylabel('log(E), E=absolute error of the integral')
grid 