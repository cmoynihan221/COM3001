function [agent]=create_agents(np)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%np - number of penguins

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
ploc=(bm_size-1)*rand(np,2)+1;      %generate random initial positions for penguins

MESSAGES.pos=(ploc);

%generate all penguins agents and record their positions in ENV_MAT_R
for p=np:-1:1
    position=ploc(p,:);
    body_temperature = PARAM.P_TEM;
    agent{p}=penguins(body_temperature,position,PARAM.P_SPD, 0);
end
