function c=set(c,prop_name,val)
%standard function to allow insertion of memory parameters from penguin object
switch prop_name

case 'pos'
    c.pos=val; 
case 'speed'
   c.speed=val; 
case 'body_temperature'
   c.body_temperature=val; 
otherwise 
   error('invalid field name')
end

