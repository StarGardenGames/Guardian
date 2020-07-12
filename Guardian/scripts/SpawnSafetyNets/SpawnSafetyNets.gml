if(irandom(spawnchance) != 1) exit; 
if(instance_number(oSafetyNet) < maxsafetynets){
	instance_create_depth(irandom(1100),irandom(590),-1,oSafetyNet)
}