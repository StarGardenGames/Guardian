event_inherited();

moveSpeed = 4;

enum WALL_STATE{
	moving_in,
	moving_out,
	extended,
	inactive,
}

state = WALL_STATE.inactive;