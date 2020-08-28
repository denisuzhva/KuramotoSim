function [ xdot ] = vanderpol( t,x )

if nargin==1
    x=t;
end
xdot(1,1)=x(2);
xdot(2,1)=-x(1)-2*(x(1)^2-1)*x(2); %for mu=2
end

