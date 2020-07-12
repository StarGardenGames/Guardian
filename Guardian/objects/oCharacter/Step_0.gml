event_inherited();

if(index == oControl.index) state = CHAR_STATE.selected; 
if(state == CHAR_STATE.selected && oControl.index != index) state = CHAR_STATE.unselected;

CharacterMovement();
CharacterDeath();

