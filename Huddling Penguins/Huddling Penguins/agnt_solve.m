function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent population.
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update
global MESSAGES
%Created by Dawn Walker 3/4/08 

n=length(agent);    %current no. of agents
n_new=0;    %no. new agents
prev_n=n;   %remember current agent number at the start of this iteration
typ = MESSAGES.atype; 
body_tem = MESSAGES.body_temperature(typ, : );
%execute existing agent update loop
for cn=1:n
    curr=agent{cn};
    % Update the temperature changed with "temperature_change" rule for each agent	
   curr=temperature_change(curr,cn);
   % if punguins body temputure is lower then 32 degree then start huddle
    if body_tem <32
        curr=huddle(curr,cn);   
    % if punguins body temputure is higher then 38 then seprate
    else 
        curr=migrate(curr,cn);
    end
    agent{cn}=curr;

end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.
