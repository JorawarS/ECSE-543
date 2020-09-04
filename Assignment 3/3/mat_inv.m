function M = mat_inv(A)
%function to calculate the inverse of a 2*2 matrix
det = A(1,1) * A(2,2) - A(1,2) * A(2,1);
M(1,1) = A(2,2) / det;
M(2,2) = A(1,1) / det;
M(1,2) = -1 * A(1,2) / det;
M(2,1) = -1 * A(2,1) / det;
end

