function [agt,temperature_change] = temperature_change(agt,cn)


global IT_STATS N_IT ENV_DATA

position [x,y] = agt.position;
initial_tem = agt.temperature;
unexposed_area = 0;

% if [x,y-1] has no other penguin agent;
% unexposed_area = unexposed_area+1;
% do same thing for [x,y+1],[x-1,y],[x+1,y]
% if [X-1,Y+1] has no other penguin agent;
% unexposed_area = unexposed_area+0.7;
% do same thing for [x-1,y+1],[x-1,y-1],[x+1,y+1],[x+1,y-1]
% Then use the final exposed_area value to determine the temperature
% decrease . So if there has no others penguin near the current penguin,
% then the temperature will decrease rapidly. Otherwise, if there has
% penguin agent in other neighbour cell. Then the temperature will be
% increased.


end

