function [xdot]=system2(t,x)

if nargin==1
    x=t;
end
xdot=zeros(2,1);
xdot(1)=x(1)*(3-x(1)-2*x(2));
xdot(2)=x(2)*(2-x(1)-x(2));
end