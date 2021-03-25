function [agt, closest]= huddle(agt,cn)

    %huddle functions for class Penguin
    %agt= Penguin
    %cn - current agent number    
    global IT_STATS N_IT ENV_DATA PARAM
    
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
       spd=agt.speed;                      %penguin migration speed in units per iteration - this is equal to the food search radius
 

       typ = MESSAGES.atype
       penguins = find(typ==1)                                      %indices of allpenguins
       ppos=MESSAGES.pos(penguins,:);                                     %extract positions of all penguins
       csep=sqrt((ppos(:,1)-pos(:,1)).^2+(ppos(:,2)-pos(:,2)).^2); 
       csep(cn)= []  %calculate distance to all penguins
       [d,ind]=min(csep);                                            %d is distance to closestpenguin, ind is index of that penguin
        nrst=penguins(ind);                                            %index of nearestpenguin(s)
       if(MESSAGES.Huddle == true)
           posNrst = MESSAGES.HLoc;
       else
           posNrst = MESSAGES.pos(nrst,:);  
       end
       
       posX = agt.pos(1); 
       posY = agt.pos(2);
       
       posNrstX = posNrst(1);
       posNrstY = posNrst(2);
       %move to the tagert point
       if(posX < posNrstX) 
           posX = posX +  PARAM.P_SPD;
       elseif(posX > posNrstX)
           posX = posX -  PARAM.P_SPD;
       end
       if(posY < posNrstY)
           posY = posY +  PARAM.P_SPD;
       elseif(posY > posNrstY)
           posY = posY -  PARAM.P_SPD;
       end
       newPos = [posX,posY];
       agt.pos = newPos
       closest = nrst;

      
           
       
       

