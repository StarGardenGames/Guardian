if(instance_place(x,y,all)) instance_destroy()
var nearestChar = instance_nearest(x,y,oCharacter)
if(point_distance(x,y,nearestChar.x,nearestChar.y) < 300) instance_destroy();
alarm[0] = 300