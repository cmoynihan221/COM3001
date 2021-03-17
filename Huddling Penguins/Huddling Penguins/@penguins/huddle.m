function [agt]= huddle(agt,cn)

    %migration functions for class FOX
    %agt=fox object
    %cn - current agent number
    
    %SUMMARY OF FOX MIGRATE RULE
    %If a fox has not eaten, it will pick a random migration direction
    %If it will leave the edge of the model, the direction is incremented by 45
    %degrees at it will try again (up to 8 times)
    %modified by D Walker 11/4/08
    
    global IT_STATS N_IT ENV_DATA
    
    %N_IT is current iteration number
    %IT_STATS is data structure containing statistics on model at each
    %iteration (no. agents etc)
    %ENV_DATA is a data structure containing information about the model
    %environment
       %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
       %    ENV_DATA.units - FIXED AS KM
       %    ENV_DATA.bm_size - length of environment edge in km
       %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
       %    of food
         
      
    bm=ENV_DATA.bm_size;   
    spd=agt.speed;   %fos migration speed in units per iteration - this is equal to the food search radius
    pos=agt.pos;     %extract current position 


    px = rand(1,bm);
    py = rand(1,bm);
    
    % choose draft value
    [x,y] = meshgrid(linspace(min(px),max(px)),linspace(min(py),max(py)));
    fun= @(t)sum(sqrt(bsxfun(@minus,t(:,1),px).^2+bsxfun(@minus,t(:,2),py).^2),2);
    d= reshape(fun([x(:),y(:)]),size(x));
    [m,i] = min(d(:));
    t0 = [x(i(1)) y(i(1))];
    
    % find min value
    [t,val] = fminunc(fun,t0,optimset('dis','off'));
    
    % draw
    contourf(x,y,d);colorbar
    hold on
    plot(t(1),t(2),'ko','MarkerFaceColor','r')
    hold off
    
    % min distance
    md = val/length(px);
    