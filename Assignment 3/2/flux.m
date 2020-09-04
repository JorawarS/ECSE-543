function[phi] = flux(x_guess)
        % Evaluates the flux
		phi = 3.978873577e7 * x_guess + 0.3 * h_val(x_guess) - 8000;
end