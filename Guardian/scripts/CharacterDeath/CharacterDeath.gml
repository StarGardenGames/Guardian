if(state = CHAR_STATE.safe) exit; 

//Leaving Screen
if(x > room_width || x < -sprite_width || y > room_height || y < -sprite_height){
	game_restart();
}

//Hitting Projectile
if(instance_place(x,y,oProjectile) || instance_place(x,y,oWall) || instance_place(x,y,oAttractor) || instance_place(x,y,oElectricWall)){
	game_restart();
}