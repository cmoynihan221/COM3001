function [agt] = temperature_change(agt,cn)


global IT_STATS N_IT ENV_DATA

%pos = agt.pos;
initial_tem = agt.temperature;
unexposed_area = 0;

pos1 = agt.pos;
for i = 0:length(penguins)
       %The pos2 is the position of other penguins
       %Distance will be calculate to detect whether there has other penguins near the current agent. 
       pos2 = penguin(i).pos;
       distance = pos1 - pos2;
       absolute_distance = sqrt(distance(1)^2 + distance(2)^2);
       %If the other agents are close, then unexposed area will be
       %increase.
       if absolute_distance < 1
           unexposed_area = unexposed_area+1; 
       end
end

% If the unexposed area more than 1, then it mean there has other penguins
% near the current penguin agent and it already huddled. The temperature
% will be increase with the unexposed area.
% If there no other penguins it mean current agent have not huddled and
% body temperature will be decreased.
if unexposed_area > 0
% The paramter 0.3 and 1 might be changed with further experiment.
    agt.temperature = initial_tem + 0.3 * unexposed_area;
else
    agt.temperature = initial_tem - 1;
end
