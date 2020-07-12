if(irandom(spawnchance) != 1) exit; 
var edge = screenEdge[irandom(3)]; //handles spawn edges
var inst = noone;
if(instance_number(oProjectile) < startingprojectilecount + numSpawns/increaserate){ //number of spawns increases as you survive longer
	switch(edge){
		case "right":
			inst = instance_create_depth(0,irandom(room_height-16),0,oProjectile);
			with(inst) dir = edge;
		break;
		case "up":
			inst = instance_create_depth(irandom(room_width-16),room_height-1,0,oProjectile);
			with(inst) dir = edge;
		break;
		case "left":
			inst = instance_create_depth(room_width+16,irandom(room_height-16),0,oProjectile);
			with(inst) dir = edge;
		break;
		case "down":
			inst = instance_create_depth(irandom(room_width-16),0,0,oProjectile);
			with(inst) dir = edge;
		break;		
	}
	numSpawns++;
	audio_play_sound(soundProjectile,1,false);
}
