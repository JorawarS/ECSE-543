%testbench for Q1. (c)
clear()
A2=sym_posdef_gen(2);
A3=sym_posdef_gen(3);
A4=sym_posdef_gen(4);
A5=sym_posdef_gen(5);

x2=[0.23;-34.32];
x3=[1.23;0.23;1.435];
x4=[10.6;-12.5;1.9;0.234];
x5=[2.67;4.67;-5.78;0.56;-0.23];

b2=mat_mul(A2,x2);
b3=mat_mul(A3,x3);
b4=mat_mul(A4,x4);
b5=mat_mul(A5,x5);

X2=Cholesky_lookahead(A2,b2);
X3=Cholesky_lookahead(A3,b3);
X4=Cholesky_lookahead(A4,b4);
X5=Cholesky_lookahead(A5,b5);


