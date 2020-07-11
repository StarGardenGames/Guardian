var spawnchance = 2; 
var edge = screenEdge[irandom(3)]; //handles spawn edges
var inst = noone;
if(instance_number(oProjectile) < 3 + numSpawns/20){ //number of spawns increases as you survive longer
	var rand = irandom(100);
	if(rand < spawnchance){
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
	}
}
