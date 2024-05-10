function [sys,x0] = reactor_sfcn(t, x, u, flag)

% Simulink interface to reactor_simu.m     
%
% Input arguments :    t    -   time in [min].
%                      x    -   states
%                      u    -   inputs
%                      flag -   indicator  of the Simulink request 
%
% Output arguments :   sys  -   results requested by Simulink, varies for each flag#
%                      x0   -   initial conditions
%--------------------------------------------------------------
% depending on flag # , sys holds different information :
%
% when flag is 1, sys contains state derivatives,
% when flag is 3 sys contains outputs; 
%            y(1)    - ?
%            y(2)    - ?
% when flag is 0, sys is initialized 
% Initialize :  define initial conditions,  X0
%               define the system in terms of number of states, inputs etc.
%             e.g. sys = [ a, b, c, d, e, f];
%            1st array,a :  number of continuous states
%            2nd array,b :  number of discrete states
%            3rd array,c :  number of outputs
%            4th array,d :  number of inputs
%            5th array,e :  flag for direct feedthrough
%            6th array,f :  the number of sample times
            
if abs(flag) == 1
  % Return state derivatives
  sys =  reactor_simu(t, x, u);

elseif abs(flag) == 3
  % Return system outputs
  sys = x;

elseif flag == 0
  % Initialize the system
  load('steadystate_cond.mat')
  x0 = [Ca T] ;
  sys = [2, 0, 2, 1, 0, 1];

else
  sys = [];  
end
  
   
