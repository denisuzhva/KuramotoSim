clear all; close all; clc;
addpath('./PhasePlanePlotterMATLAB/')
% syms x(t);
% mu = 0.9;
% [v] = odeToVectorField(diff(x, 2) + mu * (x^2 - 1) * diff(x, 1) + x == 0);
% v
% as_func = matlabFunction(v, 'vars', {'t', 'Y'})
tspan = [0, 1000];
icond = {[0, pi/2]};
Xlim = [0, 20];
Ylim = [0, 20];

figure;
PhasePlane(@kuramoto, tspan, icond, 'Xlim', Xlim, 'Ylim', Ylim);
clear;
