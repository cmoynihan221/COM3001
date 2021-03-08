classdef penguin
    %declares penguin object
    
    properties
        pos;
        speed;
        heat;
        temperature;
    end
    methods

        function obj = untitled(inputArg1,inputArg2)
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            outputArg = obj.Property1 + inputArg;
        end
    end
end

