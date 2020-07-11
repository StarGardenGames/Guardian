/// @desc Returns a week day as a string
/// @param [day_id] number to day of the week (defaults to current_weekday)

if(argument_count == 0){
	day_id = current_weekday	
}else{
	day_id = argument[0];
}
switch(day_id){
   case 0: return "sunday"; break;
   case 1: return "monday"; break;
   case 2: return "tuesday"; break;
   case 3: return "wednesday"; break;
   case 4: return "thursday"; break;
   case 5: return "friday"; break;
   case 6: return "saturday"; break;
} 

throwError("Invalid weekday ",day_id);