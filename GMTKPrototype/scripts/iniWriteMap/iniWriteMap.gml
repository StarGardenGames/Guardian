/// @desc Writes a map to ini
/// @param section section to write the map to
/// @param key key to write the map to
/// @param map map to write to ini
var section = argument[0];
var key = argument[1];
var map = argument[2];

ini_write_string(section, key, ds_map_write(map))