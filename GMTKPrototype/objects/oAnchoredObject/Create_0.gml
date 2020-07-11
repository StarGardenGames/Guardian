//NOTE: anchor positions are only really useful if you're game can change view size
// (like if if adjusts to the aspect ratio of the device). That said, if the room
// can start with different view sizes, then the screen anchor calculation won't 
// consistently  anchor it correctly (for example if you place the buttons to
// be at the bottom_right corner of a 4:3 display, but the room starts in 16:9
// then the buttons won't be anchored propery. It would have to start in 4:3, then it
// would adjust properly if the screen was changed to 16:9)

//NOTE: to get around the issue mentioned above, you'll have to make the clickable buttons
// using addInputClickable, or addInputClickablesFromRoom 

inputAnchoredObjectInit()