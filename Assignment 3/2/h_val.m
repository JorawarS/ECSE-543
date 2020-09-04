%function to calculate value of H using linear interpolation
function h = h_val(x_guess)
    global B  H
		b = x_guess*1e4;
		hb_rows = size(H,2);
    	% Linear Interpolate
    	if b > B(15)
        	slope = (H(15) - H(14)) / (B(15) - B(14));
        	h = (b - B(15)) * slope + H(15);
        	return
		end

    	for i = 1:hb_rows
        	if B(i) > b
            	slope = (H(i) - H(i-1)) / (B(i) - B(i-1));
            	h = (b - B(i-1)) * slope + H(i-1);
            	return
            end
        end
end
