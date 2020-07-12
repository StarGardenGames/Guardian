index = 0; 
screenEdge[0] = "right"; 
screenEdge[1] = "up";
screenEdge[2] = "left";
screenEdge[3] = "down";
randomize();
input_enabled = true
enum LEVEL_STATE_2{ // I guess great minds think alike since we both wanted LEVEL_STATE :P (I renamed mine, it's terrible I know)
	live,
	won,
	lost
}
level_state = LEVEL_STATE_2.live