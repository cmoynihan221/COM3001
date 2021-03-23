function [agt]= huddle(agt,cn)

    %migration functions for class FOX
    %agt=fox object
    %cn - current agent number
    
    %SUMMARY OF FOX MIGRATE RULE
    %If a fox has not eaten, it will pick a random migration direction
    %If it will leave the edge of the model, the direction is incremented by 45
    %degrees at it will try again (up to 8 times)
    %modified by D Walker 11/4/08
    
    global IT_STATS N_IT ENV_DATA
    
    %N_IT is current iteration number
    %IT_STATS is data structure containing statistics on model at each
    %iteration (no. agents etc)
    %ENV_DATA is a data structure containing information about the model
    %environment
       %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
       %    ENV_DATA.units - FIXED AS KM
       %    ENV_DATA.bm_size - length of environment edge in km
       global  IT_STATS N_IT MESSAGES
   
       pos=agt.pos;                        %extract current position 
      
       spd=agt.speed;                      %fox migration speed in units per iteration - this is equal to the food search radius
 

       
       typ=MESSAGES.atype;                                         %extract types of all agents
       pn=find(typ==1);                                            %indices of all rabbits
       ppos=MESSAGES.pos(pn,:);                                     %extract positions of all rabbits
       csep=sqrt((ppos(:,1)-pos(:,1)).^2+(ppos(:,2)-pos(:,2)).^2);  %calculate distance to all rabbits
       [d,ind]=min(csep);                                            %d is distance to closest rabbit, ind is index of that rabbit
       nrst=pn(ind);                                                %index of nearest rabbit(s)
       
       if d<=spd&length(nrst)>0    %if there is at least one  rabbit within the search radius        
           if length(nrst)>1       %if more than one rabbit located at same distance then randomly pick one to head towards
               s=round(rand*(length(nrst)-1))+1;
               nrst=nrst(s);

               nx=MESSAGES.pos(nrst,1);    %extract exact location of this rabbit
               ny=MESSAGES.pos(nrst,2);
               npos=[nx ny];    

               agt.pos=npos;               %move agent to position of this rabbit
              %send message to rabbit so it knows it's dead!
           end
       end


