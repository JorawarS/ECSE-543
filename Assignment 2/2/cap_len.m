%To calculate capacitance per unit length of the cable
clear()
[U,s]=SIMPLE2D_M('input_file.dat');
V=U(:,4);
W=8.85418782e-12*0.5*mat_mul(mat_trans(V),mat_mul(s,V));%calculate energy of one quarter of the cable
E=4*W;%total enerfy stored in cross section of cable
C=(2*E)/225;%equate total energy to 1/2CV^2 and calculate C (V=15).