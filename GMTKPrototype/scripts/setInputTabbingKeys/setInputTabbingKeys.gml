/// @desc sets the keys to use for tabbing
/// @param tab_key key to use for tab
/// @param enter_key key to select current tabbed value

var tab_key = argument0;
var enter_key = argument1;

with(oInput){
	self.tab_key = tab_key;
	self.enter_key = enter_key
}