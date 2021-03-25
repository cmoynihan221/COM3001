classdef penguins % declares penguins object
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties          %define penguins properties (parameters) 
        body_temperature;
        pos;
        speed;
        huddle;
    end
    
    methods
        function p = penguins(varargin)
           %p=penguins(body_temperature,pos,speed....)
                %
                % The body temperature of each agent. (Usually it will set
                % as 38 at the beginning)
                % pos - vector containg x,y, co-ords 
                % speed - the speed parameter (Usually it set as 2)
                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                 	p.body_temperature=[];
                    p.pos=[];
                    p.speed=[];
                case 1                         %input is already a penguin, so just return!
                    if (isa(varargin{1},'penguin'))		
                        p=varargin{1};
                    else
                        error('Input argument is not a penguin')
                    end
                case 3                          %create a new penguin (currently the only constructor method used)
                  	p.body_temperature =varargin{1};
                    p.pos=varargin{2};
                    p.speed=varargin{3};       %number of iterations since penguin last reproduced.
                case 4                       %create a new penguin (currently the only constructor method used)
                  	p.body_temperature =varargin{1};
                    p.pos=varargin{2};
                    p.speed=varargin{3};  
                    p.huddle=varargin{4}; 
                otherwise
                    error('Invalid no. of input arguments for penguin')
            end
        end
    end
    
end
