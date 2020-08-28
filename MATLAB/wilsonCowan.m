function [xdot] = wilsonCowan(t, x)

	if nargin == 1
		x = t;
	end

	n_ag = 2;

	xdot = zeros(n_ag, 1);

	xdot(1, 1) = -x(1) + 1 / (1 + exp(-(2 * x(1) - 10 * x(2))));
	xdot(2, 1) = -x(2) + 1 / (1 + exp(-(2 * x(2) - 10 * x(1))));
		
end

