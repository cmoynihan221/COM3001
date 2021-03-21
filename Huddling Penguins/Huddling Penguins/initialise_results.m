function initialise_results(np,nsteps)

 global  IT_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('div_p',[zeros(1,nsteps+1)]
 );               %remaining vegetation level
 IT_STATS.tot_r(1)=nr;
