clc; clear; close all;

%% Non-linear system 1
tspan=[0,50];
icond={[0.01, -5], [-0.01,-5], [0.01,0], [-0.01,0]};
figure;
PhasePlane(@system1,tspan,icond);
clear;

%% Non-linear system 2
x_vec=-3:3;
y_vec=-3:3;
[X_mat,Y_mat]=meshgrid(x_vec,y_vec);
icond=cell(1,numel(X_mat));
for n=1:numel(X_mat)
    icond{n}=[X_mat(n),Y_mat(n)];
end
icond={icond{1,:},[0.1,0.1],[0.1,0.2],[0.2,0.1],[0.1,0.3]...
       ,[0.3,0.1],[0.1,0.4],[0.4,0.1]};
tspan=[0,10];
Xlim=[-5,5]; Ylim=[-5,5];
figure;
PhasePlane(@system2,tspan,icond,'Xlim',Xlim,'Ylim',Ylim,'hx',0.5,'hy',0.5,'scale',2,'PlotSingularPoints',true);
clear;

%% Vanderpol system
figure;
tspan=[0,50];
icond={[0.1, 0.1], [5,5], [-5,5]};
PhasePlane(@vanderpol,tspan,icond,'scale',2,'ArrowSize',3,'ArrowHeads',true,'PlotSingularPoints',true);
clear;
