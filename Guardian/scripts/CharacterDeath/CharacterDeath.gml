if(state = CHAR_STATE.safe) exit; 

//Leaving Screen
if(x > room_width || x < -sprite_width || y > room_height || y < -sprite_height){
	with(oControl){
		level_state = LEVEL_STATE_2.lost
	}
	sprite_index = sCharacterElectrified
	death_ring = true
	image_index = 0
	audio_play_sound(soundDeath,1,false)
	with(oLevelTimer) dt = 0;
}

//Hitting Projectile
if(instance_place(x,y,oProjectile) || instance_place(x,y,oWall) || instance_place(x,y,oAttractor) || instance_place(x,y,oElectricWall)){
	with(oControl){
		level_state = LEVEL_STATE_2.lost
	}
	sprite_index = sCharacterElectrified
	death_ring = true
	image_index = 0
	audio_play_sound(soundDeath,1,false)
	with(oLevelTimer) dt = 0;
}