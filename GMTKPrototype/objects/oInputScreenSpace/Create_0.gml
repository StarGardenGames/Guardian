// This object exists as an optional reference for the oInputClickableObjects
// Those objects will use this to as a reference for anchoring 

// For example if a oInputClickable is anchored to the bottom left, it will first calculate it's
// position relative to the bottom left corner of the oInputScreenSpace object, and then oInputClickable
// will reposition it's self relative to the bottom left corner of the camera

// The reason it doesn't reference the camera in the first place, is because the camera can be different
// depending on the device. So If you place the buttons in the room based on a 16:9 device, and the user
// plays on a 4:3 device the buttons won't be anchored properly