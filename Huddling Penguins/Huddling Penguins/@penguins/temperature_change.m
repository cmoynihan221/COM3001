function [agt,temperature_change] = temperature_change(agt,cn)


    global IT_STATS N_IT ENV_DATA
    
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
    position = agt.pos;
    initial_tem = agt.temperature;
    unexposed_area = 0;
    
    position1 = agt.pos;
    for i = 0:length(penguins)
           position2 = penguin[i].position
           distance = position1 - position2
           absolute_distance = square root of(distance[1]^2 + distance[2]^2)
           if absolute_distance < 1
               
           end
    end
    
    %The code below was my past idea.
     %position[x,y] = agt.position
    %matrixN = [[x,y-1];[x,y+1];[x-1,y];[x+1,y]];
    %matrixC = [[x-1,y+1];[x-1,y-1];[x+1,y+1];[x+1,y-1]];
    %for n = 1:(matrixN
    %    if isa([x,y],'penguins')
            
    %    end
    %end
            
    %if isa([x,y-1],'penguins')
    %    unexposed_area = unexposed_area+1;
    %end
    %if isa([x,y+1],'penguins')
    %    unexposed_area = unexposed_area+1;
    %end
    %if isa([x-1,y],'penguins')
    %    unexposed_area = unexposed_area+1;
    %end
    %if isa([x+1,y],'penguins')
    %    unexposed_area = unexposed_area+1;
    %end
    %if isa([x-1,y+1],'penguins')
    %    unexposed_area = unexposed_area+0.7;
    %end
    %if isa([x-1,y-1],'penguins')
    %    unexposed_area = unexposed_area+0.7;    
    %end
    %if isa([x+1,y+1],'penguins')
    %    unexposed_area = unexposed_area+0.7;    
    %end
    %if isa([x+1,y-1],'penguins')
    %    unexposed_area = unexposed_area+0.7;    
    %end
    
    %if (unexposed_area >0)is not ture
    %    agt.temperature = agt.temperature - 1;
    %else 
    %    agt.temperature = agt.temperature + 0.1*unexposed_area;
    
    
    end
    
             
    