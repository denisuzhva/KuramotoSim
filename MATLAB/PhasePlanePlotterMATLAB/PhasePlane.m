function []=PhasePlane(system,tspan,icond,varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% VERY IMPORTANT NOTE %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if the property 'PlotSingularPoints' is true. the lines below must be
% inserted in the function system(t,x):
%
%       if nargin==1
%           x=t;
%       end
%
%
% PhasePlane(system,tspan,icond) plots the phase plane portrait for the 
% second order system defined by the input argument system(t,x).
% The pahse plane can be recognised by two main indicators, the first one
% is the quiver plot that indicate the slope of the trajectory at each
% point in the plane. The second indicator is the trajectory itself, this
% trajectory is plotted for each initial condition 
% in the cell array "icond" for the time span defined in "tspan".
%
%   system: is a function handle, this function contains the charachteristics
%           of the non-linear system, this function is expected to be written in the
%           form
%
%   tspan: is a 1x2 vector that contains the initial and final time values.
%
%   icond: is a cell array that contains some initial conditions, the
%   trajectories for these initial conditions are needed to be plotted in
%   the phase plane. All the initial conditions in icond are 1x2 vectors.
%
%
% PhasePlane(system,tspan,icond,property,PropertyValue) plots the
% phase plane according to the properties defined. the accepted properties
% are:
%
%   'Xlim'      defines the X limits of the plot (2x1 vector)
%
%   'Ylim'      defines the Y limits of the plot (2x1 vector)
%
%   'hx'        defines the X step for the quiver plot (1x1 vector)
%
%   'hy'        defines the Y step for the quiver plot (1x1 vector)
%
%   'scale'     defines the scale of the quiver plot (1x1 vector. Range 1-5)
%   
%   'ArrowHeads'    deterimine whether to plot diriction arrows on each
%   trajectory or not. (boolean, false by default)
%
%   'ArrowSize'     defines the size of arrow heads plotted on each
%   trajectory (1x1 vector. Range 100-1000)
%
%   'PlotSingularPoints' determine whether to show the singular points on
%   the potrait or not (boolean, false by default).
%   Plotting singular points can make the code very time consuming.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Created by Ahmed.M.Taha. at Cairo university. 2017 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



hy=0.5;
hx=0.5;
Ylim=[-5,5];
Xlim=[-5,5];
scale=1;
PlotSingularPoints=false;
ArrowHeads=false;
ArrowSize=2;

if ~isempty(varargin)
    for ii=1:length(varargin)
        if ischar(varargin{ii})
            switch varargin{ii}
                case 'scale'
                    scale=varargin{ii+1};
                case 'Xlim'
                    Xlim=varargin{ii+1};
                case 'Ylim'
                    Ylim=varargin{ii+1};
                case 'hx'
                    hx=varargin{ii+1};
                case 'hy'
                    hy=varargin{ii+1};
                case 'PlotSingularPoints'
%                     if isboolean(varargin{ii+1})
                        PlotSingularPoints=varargin{ii+1};
%                     else
%                         error('the property PlotSingularPoints takes only 0 or 1 values');
%                     end
                case 'ArrowHeads'
                    ArrowHeads=varargin{ii+1};
                case 'ArrowSize'
                    ArrowSize=varargin{ii+1};
                otherwise
                    warning(['Undefined property',varargin{ii}]);
            end
        end
    end
end
clear varargin;

%% solving system equations for all defined initial conditions
for n=1:length(icond)
    [T,x]=ode23(system,tspan,icond{n});
    clear T;
    x1=x(:,1);
    x2=x(:,2);
    hold on;
    plot(x1,x2,'k')
    if ArrowHeads
        index1=ceil(mean(0:length(x)));
        index2=ceil(mean(0:index1));
        arrowh([x1(index1), x1(index1+1)], [x2(index1), x2(index1+1)],'r',ArrowSize*100);
        arrowh([x1(index2), x1(index2+1)], [x2(index2), x2(index2+1)],'r',ArrowSize*100);
    end
end

%% quiver plot and singularities determination
x_vec=Xlim(1):hx:Xlim(2);
y_vec=Ylim(1):hy:Ylim(2);
[X,Y]=meshgrid(x_vec,y_vec);
U=zeros(size(X));
V=zeros(size(X));
for n=1:numel(X)
    Out=system([X(n),Y(n)]);
    U(n)=Out(1);
    V(n)=Out(2);
    if PlotSingularPoints
        if mod(n,10)==0
            Singular=fsolve(system,[X(n),Y(n)]);
            if ~isnan(Singular)
            hold on; plot(Singular(1),Singular(2),'k*','LineWidth',1.2);
            end
        end
    end
end
 
hold on;
quiver(X,Y,U,V,scale,'b')
grid minor; box on;
plot([x_vec(1),x_vec(end)],[0,0],'k-.',[0,0]...
    ,[y_vec(1),y_vec(end)],'k-.');
xlim([x_vec(1),x_vec(end)]); ylim([y_vec(1),y_vec(end)]);
xlabel('$x_1$','interpreter','latex','FontSize',14);
ylabel('$x_2$','interpreter','latex','FontSize',14);
end
