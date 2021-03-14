classdef penguins % declares pemguins object
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        body_temperature;
        postion;
        speed;
    end
    
    methods
        function p = penguins(varargin)
           %f=fox(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that rabbit has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                 	p.body_temperature=[];
                    p.postion=[];
                    p.speed=[];
                case 1                         %input is already a fox, so just return!
                    if (isa(varargin{1},'penguin'))		
                        p=varargin{1};
                    else
                        error('Input argument is not a fox')
                    end
                case 5                          %create a new fox (currently the only constructor method used)
                  	p.body_temperature =varargin{1};
                    p.postion=varargin{2};
                    p.speed=varargin{3};       %number of iterations since fox last reproduced.
                otherwise
                    error('Invalid no. of input arguments for fox')
            end
        end
    end
    
end
