function [xdot] = kuramoto(t,x)

if nargin==1
    x=t;
end
%xdot(1,1) = 0.00042526 + 0.46 * sin(x(2) - x(1) + (pi / 2 - 0.2));
%xdot(2,1) = 0.00100007 + 0.46 * sin(x(1) - x(2) + (pi / 2 - 0.2));
Ku = 1;
w = 1;
KU = 0;
U = t(1);
xdot(1,1) = w + Ku * sin(x(2) - x(1)) + KU * U;
xdot(2,1) = w + Ku * sin(x(1) - x(2)) + KU * U;
end

