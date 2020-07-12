alarm[3] = character_spawn_seconds*room_speed 

var active_walls = false
with(oWall){
	if(state != WALL_STATE.inactive) active_walls = true
}

if(active_walls){
	alarm[3] = room_speed
	exit
}

var c = choose(oCharacterLeft, oCharacterRight, oCharacterDown, oCharacterUp, oCharacterOnline) 
with(instance_create_depth(random_range(350, 850), random_range(200, 500), 0, c)){
	repeat(10){
		var collision = place_meeting(x,y,oProjectile) || place_meeting(x,y,oWall)
		if(collision){
			x = random_range(350, 850)
			y = random_range(200, 500)
		}else{
			break;	
		}
	}
}