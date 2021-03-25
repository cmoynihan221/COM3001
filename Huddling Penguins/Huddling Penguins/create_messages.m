function create_messages(np,agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   %    MESSAGE.body_temperature - list of every agent body temperature.
   
 global MESSAGES
 
 for an=1:length(agent)
     if isa(agent{an},'penguins')
        MESSAGES.atype(an)=1;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.body_temperature(an,:)=get(agent{an},'body_temperature');
     else
        MESSAGES.atype(an)=0; 
        MESSAGES.pos(an,:)=[-1 -1];
     end
     MESSAGES.dead(an)=0;
     MESSAGES.Huddle = 0;
     MESSAGES.HuddleNum= 0;
     MESSAGES.HLoc = [];
 end
