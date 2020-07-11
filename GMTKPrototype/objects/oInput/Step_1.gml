switch(input_mode){
case INPUT_MODE.standard:
	inputReadLiveInput();
	input_frame++
	break;
case INPUT_MODE.record:
	inputReadLiveInput();
	inputRecordInput();
	break;
case INPUT_MODE.replay:
	inputReadReplayInput();
	inputUpdateFPS();
	break;
}