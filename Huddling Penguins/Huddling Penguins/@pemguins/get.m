function val=get(c,prop_name)
%standard function to allow extraction of memory parameters from penguin object
switch prop_name
   
case 'pos'
    val=c.pos;
case 'speed'
    val=c.speed;
case 'heat_transfer'
    val=c.heat_transfer; 
case 'body_temperature'
    val=c.body_temperature;  
otherwise 
   error('invalid field name')
end

