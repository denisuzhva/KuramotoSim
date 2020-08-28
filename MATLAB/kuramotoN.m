function [theta_dot] = kuramotoN(t, theta)

	if nargin == 1
		theta = t;
	end

	n_ag = 2;
	Ku = 10;
	w = 1;
	KU = 0;
	U = t(1);
	delta = 0;

	theta_dot = zeros(n_ag, 1);

	for i = 1:n_ag
		sums1 = 0;
		sums2 = 0;
		for j = 1:n_ag
			sums1 = sums1 + (theta(j) - theta(i) - delta);
			sums2 = sums2 + (theta(j) - theta(i));
		end
		sums1_sin = sin(sums1);
		sums2_sin = sin(sums2);
		theta_dot(i,1) = w + Ku * sums1_sin + 0 * Ku * sums2_sin;
	end

end

