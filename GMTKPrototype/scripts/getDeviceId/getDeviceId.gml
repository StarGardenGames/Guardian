/// @desc Returns the unique(ish) id for the device

// TODO: this should be reworked, here are some resources to consider
// https://marketplace.yoyogames.com/assets/5353/uuid-v4
// https://forum.yoyogames.com/index.php?threads/get-unique-identifier-of-the-mobile-device.17315/ (includes os info suggestion)

var rID = "unknown";
ini_open("device.ini");
    if (ini_key_exists("device", "id")) {
        rID = ini_read_string("device", "id", "unknown");
    } else {
        rID = ""
		repeat(argument0)
		{
		    rID += chr(ord("a") + irandom(25));
		}
        ini_write_string("device", "id", rID);
    }
ini_close();



return rID;