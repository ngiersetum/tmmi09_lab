clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L = 10; % m
b = 5e-2; % m
h = 10e-2; % m
E = 200e9; % Pa
rho = 7850; % kg/m^3
I = (b*h^3)/12;
M = b*h*L*rho; % total mass, kg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2 DOF
DOF = 6; % number of degrees of freedom
m = M/DOF; % mass per point mass in lumped system, kg
keq = (2058*E*I)/(2911*L^3); % equivalent spring stiffness
%
% set up matrix A from (A - lambda*I)*x = 0
A = (keq/m).*...
	[4792 -4613  2016  -540   144   -36
    -4613  6808 -5153  2160  -576   144
     2016 -5153  6952 -5189  2160  -540
     -540  2160 -5189  6952 -5153  2016
      144  -576  2160 -5153  6808 -4613
	  -36   144  -540  2016 -4613 4792];
%
lambda = eig(A); % solve eigen value problem
omega = sqrt(lambda); % calc. natural circular frequencies, rad/s
f = omega/(2*pi); % calc. natural frequencies, Hz
%
disp([num2str(DOF), ' DOF']);
for i = 1:DOF
	disp(['      omega', num2str(i), ':  ', num2str(f(i)), ' Hz']);
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


















