function [agt] = temperature_change(agt,cn, unexposed_area)


global ENV_DATA MESSAGES

%pos = agt.pos;
initial_tem = agt.body_temperature;
r = rand(1);


% If the unexposed area more than 1, then it means there has other penguins
% near the current penguin agent and it already huddled. The temperature
% will be increase with the unexposed area.
% If there no other penguins it mean current agent have not huddled and
% body temperature will be decreased.

if unexposed_area == 0
    hf = 1;
elseif unexposed_area <3 & unexposed_area >0
    hf = 0.5;
elseif unexposed_area >=3 & unexposed_area <=6 
    hf = 0.2;
elseif unexposed_area >6
     hf = 0
end
% The paramter 0.3 and 1 might be changed with further experiment.
% Also consider the ENV_DATA.bm_temperature
hl = (-(exp((-ENV_DATA.bm_temperature/25)-0.6)))*hf;
hg = 1;
hc = hl+hg
agt.body_temperature = initial_tem + (hc);
end


             
    
