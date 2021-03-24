function [agt] = temperature_change(agt,cn, unexposed_area)


global ENV_DATA MESSAGES

%pos = agt.pos;
initial_tem = agt.body_temperature;



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


             
    
