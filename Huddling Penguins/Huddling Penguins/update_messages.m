function [nagent,nn]=update_messages(agent,prev_n,temp_n)

%copy all surviving and new agents in to a new agent list - dead agents
%will be empty structures

%agent - list of existing agents, including those that have died in the
%current iteration
%prev_n - previous number of agents at the start of this iteration
%temp_n - number of existing agents, including those that have died in the
%current iteration


%global variables
%N_IT current iteration no
%IT_STATS data structure for saving model statistics
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
%ENV_DATA - is a data structure containing information about the model
   %environment

global MESSAGES IT_STATS N_IT ENV_DATA

nagent=cell(1,temp_n);                  %initialise list for surviving agents
nn=0;                                   %tracks number of surviving agents
for cn=1:temp_n
  
                        %if agent is not dead
        nagent{cn}=agent{cn};           %copy object into the new list
        pos=get(agent{cn},'pos');
        MESSAGES.pos(cn,:)=pos;                    
        MESSAGES.atype(cn)=1;
        MESSAGES.body_temperature(cn)= agent{cn}.body_temperature;
        IT_STATS.tot_p(N_IT+1)=IT_STATS.tot_p(N_IT+1)+1;
        IT_STATS.hud(N_IT+1)= MESSAGES.Huddle;
        IT_STATS.avg_temp(N_IT+1)= mean(MESSAGES.body_temperature);
        IT_STATS.huddleNum(N_IT+1)= MESSAGES.HuddleNum;
        MESSAGES.dead(cn)=0;           %clear death message
         nn=nn+1;
   
end
IT_STATS.tot(N_IT+1)=nn;                %update total agent number
