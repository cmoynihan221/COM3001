function [unexposed_area, neighbours] = getNeighbours(agt)  
global ENV_DATA MESSAGES
    unexposed_area = 0;
    % Get the position list of penguins agent
    typ = MESSAGES.atype; 
    penguin_only = find(typ==1); 
    pos1 = agt.pos;
    neighbours = []
    penguin_positions = MESSAGES.pos(penguin_only, : );
    for i = 1:length(penguin_positions)
        %Caculate the distance between current agents to other agents
        disp(pos1);
        pos2 = penguin_positions(i, :) 
        distance = pos1 - pos2;
        absolute_distance = sqrt(distance(1)^2 + distance(2)^2);
        %If the other agents are close, then unexposed area will be
        %increase.
        if (absolute_distance < 1.5) && (absolute_distance~=0)
            unexposed_area = unexposed_area+1; 
            neighbours(end+1) = i;
        end
        disp(unexposed_area);
    end
end

