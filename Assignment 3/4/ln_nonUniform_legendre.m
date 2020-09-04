%script to integrate ln(x) for N=10 with non uniform segments
integral =0;
error =0;
i=7;
pts=linspace(0,0.3,i+1);
for j=1:i
    integral = integral + ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*sqrt(3))) + ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*-sqrt(3)));
end 
i=3;
pts=linspace(0.3,1,i+1);
for j=1:i
    integral = integral + ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*sqrt(3))) + ((pts(j+1)-pts(j))/2)*log( (pts(j)+pts(j+1))/2 + (pts(j+1)-pts(j))/(2*-sqrt(3)));
end 
error= abs(-1-integral);