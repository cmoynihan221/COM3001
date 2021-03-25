function initialise_results(np,nsteps)

 global  IT_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('hud',[zeros(1,nsteps+1)],...       %  The huddled penguins per iteration
                'huddleNum',[zeros(1,nsteps+1)],... %  The numbers of huddled penguins per iteration 
                'avg_temp',[zeros(1,nsteps+1)],...  %  The average temperature of penguins per iteration
                'mig',[zeros(1,nsteps+1)],...       %  no. agents migrating per iteration
                'tot',[zeros(1,nsteps+1)],...	    %  total no. agents in model per iteration
                'tot_p',[zeros(1,nsteps+1)]); 
IT_STATS.tot_p(1)=np;
