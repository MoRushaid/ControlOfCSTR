function dx = reactor(t ,x, p) 

% Model Conditions 
Ca  = x(1);                   
T   = x(2);                  
Ea  = p.Ea;              
k0  = p.k0;                
dH  = p.dH;               
U   = p.U;                       
rhocp = p.rhocp;           
R   = p.R;                  
V   = p.V;                     
F   = p.F;                  
Caf = p.Caf;              
Tf  = p.Tf;                     
A   = p.A;    
Tj  = p.Tj;

% Equations 
ra  = k0 * exp(-Ea / (R * (T + 460))) * Ca; 
dCa = (F / V) * (Caf - Ca) - ra; 
dT  = (F / V) * (Tf - T) - (dH) / (rhocp) * ra - (U * A) / (rhocp * V) * (T - Tj); 
dx  = [dCa; dT]; 