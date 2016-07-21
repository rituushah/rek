function xprime=msd_system(t,x)
% system parameters are defined as global and come from the solver script
global J5 m10 K8 radius f3 R1 C2 e1 e2 

% xprime is the states rate vector and x is state vector. 
%we have x'=Ax; A is the dynamic matrix of our system that we have from
%state equations. t is time. 

xprime=[ 1/(R1*C2)    0        0            0;
         0          -1/J5      -radius/K8      0 ;
        0          radius/J5       0           -1/m10 ;
        0              0            1/K8           0   ] *    [x(1) ; x(2) ; x(3); x(4)] + [f3; e1; 0; e2]; 
