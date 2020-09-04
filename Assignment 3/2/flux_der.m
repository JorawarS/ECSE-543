function[phi_der] = flux_der(x_guess)
        % Evaluates the flux derivative 
		phi_der = 3.978873577e7 + 0.3 * h_derivative(x_guess)*1e4;
end
