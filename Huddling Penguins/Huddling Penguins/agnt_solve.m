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

    %current no. of agents

   %remember current agent number at the start of this iteration
typ = MESSAGES.atype
penguins = find(typ==1)
n = length(penguins) 
prev_n=n
body_tem = MESSAGES.body_temperature(penguins, :)
%execute existing agent update loop
for cn=1:n
    tem = body_tem(cn, :) 
    curr=agent{cn};
    % Update the temperature changed with "temperature_change" rule for each agent	
    curr=temperature_change(curr,cn);
   % if punguins body temputure is lower then 32 degree then start huddle
    if tem < 32
        curr=huddle(curr,cn);   
        disp("hello");
    % if punguins body temputure is higher then 38 then seprate
    else 
        curr=migrate(curr,cn);
        disp("temputure did not change");
    end
     agent{cn}=curr;

end

temp_n=n; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.
