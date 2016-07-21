close all

%define system parameters (the same thing in system model function)
global J5 m10 K8 radius x1 R1 C2 e1 e2 f3 h 

h = 0.17; 
J5 = 2; 
m10 = .033 ;  
K8 = 5.07 ; 
radius = 0.05 ;  
f3 = sqrt(2*9.81*h) ; 
R1 = 3497.48; %3497.48
C2 = 0.000001987  ; %0.000001987  
e1 = 1.1*0.5 ; %1.1*0.5
e2 = m10*9.81;   
%%
% tspan= time span for simulation,  x0 = initial condition , x(1)=q5  x(2)=p2
%  x(3)=P6    , System model is in msd_system function 

tspan=[0 50];
x0=[0.2;0;2;0.2];

[T,x]=ode45(@msd_system,tspan,x0);
%% 

% plotting the results. The frist three plots will show each state vs time, the
% fourth plot is q5 vs p2 and the separate plot is q5 vs p2 vs p6 which
% shows the trajecotry of the system in its state space. Depending on the
% initial condition in which we release the system, it will follow a path
% toward its equilibrium point at zero. 


subplot(2,2,1);
plot(T,x(:,1));

xlabel('T');
ylabel('q1 bucket');
grid on

subplot(2,2,2);
plot(T,x(:,2));

xlabel('T');
ylabel('p5 wheel inertia');
grid on

subplot(2,2,3);
plot(T,x(:,3));

xlabel('T');
ylabel('q8 spring');
grid on

subplot(2,2,4);
plot(T,x(:,4));

xlabel('T');
ylabel('p10 mass inertia');
grid on

% figure;
% plot3(x(:,1),x(:,2),x(:,3),'r')
% xlabel('q8');
% ylabel('q1');
% zlabel('p5');
% grid on

hold on
