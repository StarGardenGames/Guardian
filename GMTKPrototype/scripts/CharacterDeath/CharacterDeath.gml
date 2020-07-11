//Leaving Screen
if(x > room_width || x < -sprite_width || y > room_height || y < -sprite_height){
	game_restart();
}

//Hitting Projectile
if(instance_place(x,y,oProjectile)){
	game_restart();
}