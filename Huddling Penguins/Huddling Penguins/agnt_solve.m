function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent population.
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update
global MESSAGES IT_STATS
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
    
    na = getNeighbours(curr);
    % Update the temperature changed with "temperature_change" rule for each agent	
    curr=temperature_change(curr,cn, na(1));
   % if punguins body temputure is lower then 32 degree then start huddle
    
    % If the body temperature lower than threshold value and current agent
    % have not huddle yet. Then it will try to found other penguins agent
    % to huddle.    
    if tem < -7 & curr.huddle == 0
        if(na(1) < 1 & MESSAGES.Huddle == 0 )
            curr=huddle(curr,cn);
        elseif(MESSAGES.Huddle == 0)
                MESSAGES.Huddle = 1;
                MESSAGES.HLoc =curr.pos;
                curr.huddle = 1;    
                MESSAGES.HuddleNum =MESSAGES.HuddleNum+1;
        elseif(MESSAGES.Huddle == 1 )
            distance = curr.pos - MESSAGES.HLoc;
            absolute_distance = sqrt(distance(1)^2 + distance(2)^2);
            if(absolute_distance>2)
                curr=huddle(curr,cn);
            else
                MESSAGES.HuddleNum =MESSAGES.HuddleNum+1;
                curr.huddle = 1;
            end
        end
    elseif tem >-7 & curr.huddle == 0
      curr=migrate(curr,cn);
    elseif tem < 37 & curr.huddle == 1
        if(MESSAGES.HuddleNum < 6)
            curr.huddle == 0
        end
    else
        MESSAGES.HuddleNum =MESSAGES.HuddleNum-1;
        curr.huddle = 0
        curr=migrate(curr,cn);
        
    end
    
     agent{cn}=curr;
    
end

temp_n=n; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.
