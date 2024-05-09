% Main File 

%% cleaning
clc;
clear all;
close all;

%% Parameters
p.Ea = 32400;               % Enthalpy [BTU/lbmol]
p.k0 = 15e12;               % Constant [1/hr] 
p.dH = 45000;               % Change in Enthalpy [BTU/lbmol] 
p.U  = 75;                  % Heat Transfer Coefficient[BTU/hr-ft^2-oF] 
p.rhocp = 53.2;             % [BTU/ft^3] 
p.R  = 1.987;               % Specific Heat [BTU/lbmol-oF] 
p.V  = 750;                 % Volume [ft^3] 
p.F  = 3000;                % Feed Rate [ft^3/hr] 
p.Caf = 0.132;              % Final Concentration[lbmol/ft^3] 
p.Tf = 60;                  % Final Temperature [oF] 
p.A  = 1221;                % Area [ft^2] 
p.Tj = 60;                  % Jacket Temperature [oF] 

%% Initial Conditions
x = [0.1 30];               % x(1) = Ca   Concentration [lbmol/ft^3] 
                            % x(2) = T     Temperature [oF] 
tspan = [0 3];

[t, x] = ode45(@reactor, tspan, x, [], p);

%% Plot
figure(1)
subplot(1, 2, 1)
plot(t, x(:, 1), 'g')
title('Concentration(Ca) vs Time')

figure(1)
subplot(1, 2, 2)
plot(t, x(:, 2), 'b')
title('Temperature(T) vs Time')

%% Steady State Values
Ca = x(end, 1);
T = x(end, 2);
tend = t(end);
save('steadystate_cond.dat', 'Ca', 'T', 'tend', '-ascii');
save('steadystate_cond.mat', 'Ca', 'T', 'tend');