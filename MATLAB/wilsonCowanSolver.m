clear all; close all; clc;
addpath('./PhasePlanePlotterMATLAB/')

tspan = [0, 10];
n_ag = 2;
%icond = [0 : 1/n_ag : 1];
icond = [0, 1];

% Solution
%[times, thetas] = ode45(@kuramotoN, tspan, icond);

figure;
%hold on;
%for i = 1:n_ag
%	plot(times, thetas(:, i));
%end
PhasePlane(@wilsonCowan, tspan, {icond});

grid on;
