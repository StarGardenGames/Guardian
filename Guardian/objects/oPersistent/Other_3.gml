ini_open("save.ini")
ini_write_string("AnimalControl", "record_map", json_encode(my_record))
ini_close()

writeJsonFile("save.json", my_record)