adjustWindowIfResized()
camX(640 - (camW())/2)
camY(360 - (camH())/2)

if(checkReleased("restart")){
	game_restart();
}