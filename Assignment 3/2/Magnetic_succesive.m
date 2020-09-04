%function to calculate the flux using succesive substitution
global B H
B=[0,0.2,0.4,0.6,0.8,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9];
H=[0,14.7,36.5,71.7,121.4,197.4,256.2,348.7,540.6,1062.8,2318,4781.9,8687.4,13924.3,22650.2];
x_guess=0;
err=1e-6;
i=0;
while abs(flux(x_guess)/flux(0)) > err 
    i = i + 1;
    x_guess = x_guess - 1e-8*flux(x_guess) ;
end