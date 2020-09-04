%function to calculate derivative of H using linear interpolation
function h_der = h_derivative(x_guess)
    global B  H
		b = x_guess*1e4;
		hb_rows = size(H,2);
    	% Interpolate
    	if b > B(15)
            h_der = (H(15) - H(14)) / (B(15) - B(14));
        	return
        end

    	for i = 1:hb_rows
        	if B(i) > b
            	h_der = (H(i) - H(i-1)) / (B(i) - B(i-1));
            	return
            end
        end
end

