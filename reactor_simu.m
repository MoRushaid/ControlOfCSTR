function dx = reactor_simu(~,x,u)

% Define states 
Ca = x(1);
T = x(2);

% Inputs
Tj  = u(1);

% Parameters
Ea = 32400;               % Enthalpy [BTU/lbmol]
k0 = 15e12;               % Constant [1/hr] 
dH = 45000;               % Change in Enthalpy [BTU/lbmol] 
U = 75;                   % Heat Transfer Coefficient[BTU/hr-ft^2-oF] 
rhocp = 53.2;             % [BTU/ft^3] 
R = 1.987;                % Specific Heat [BTU/lbmol-oF] 
V = 750;                  % Volume [ft^3] 
F = 3000;                 % Feed Rate [ft^3/hr] 
Caf = 0.132;              % Final Concentration[lbmol/ft^3] 
Tf = 60;                  % Final Temperature [oF] 
A = 1221;                 % Area [ft^2] 

% Equations 
ra = k0 * exp(-Ea / (R * (T + 460))) * Ca; 
dCa = (F / V) * (Caf - Ca) - ra; 
dT = (F / V) * (Tf - T) - (dH) / (rhocp) * ra - (U * A) / (rhocp * V) * (T - Tj); 
dx = [dCa; dT]; 


