function [agt] = temperature_change(agt,cn)


global ENV_DATA MESSAGES

%pos = agt.pos;
initial_tem = agt.body_temperature;
unexposed_area = 0;
typ = MESSAGES.atype; 
penguin_only = find(typ==1); 
pos1 = agt.pos;
penguin_positions = MESSAGES.pos(penguin_only, : );
for i = 1:length(penguin_positions)
        disp(pos1);
        pos2 = penguin_positions(i, :) 
        distance = pos1 - pos2;
        absolute_distance = sqrt(distance(1)^2 + distance(2)^2);
%       %If the other agents are close, then unexposed area will be
       %increase.
       if (absolute_distance < 1) && (absolute_distance~=0)
           unexposed_area = unexposed_area+1; 
       end
       disp(unexposed_area);
end
% If the unexposed area more than 1, then it means there has other penguins
% near the current penguin agent and it already huddled. The temperature
% will be increase with the unexposed area.
% If there no other penguins it mean current agent have not huddled and
% body temperature will be decreased.
if unexposed_area > 0
% The paramter 0.3 and 1 might be changed with further experiment.
% Also consider the ENV_DATA.bm_temperature
    disp('test');
    agt.body_temperature = initial_tem + 0.3;
else
    disp('check');
    agt.body_temperature = initial_tem - 1;
end


             
    
