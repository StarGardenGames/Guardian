var l = argument0;
var s = "["
for(var i = 0; i < ds_list_size(l); i++){
	s = concat(s, " ", l[| i])
	if(i != ds_list_size(l)-1){
		s = concat(s, ",")	
	}
}
s = concat(s, "]") 
log(s)