clear all; close all; clc;
addpath('./PhasePlanePlotterMATLAB/')

n_ag = 2;
tspan = [0, 100];
icond = linspace(0, 1, n_ag);
%icond1 = linspace(0, 2 * pi, n_ag / 2);
%icond2 = linspace(0, 2 * pi, n_ag / 2) + 1;
%icond = cat(1, icond1, icond2);

% Solution
[times, thetas] = ode45(@kuramotoN, tspan, icond);

figure;
hold on;
for i = 1:n_ag
	plot(times, sin(thetas(:, i)));
end

Xlim = [0, 10];
Ylim = [0, 10];

%PhasePlane(@kuramotoN, tspan, {[1, 0]}, 'Xlim', Xlim, 'Ylim', Ylim);

grid on;
