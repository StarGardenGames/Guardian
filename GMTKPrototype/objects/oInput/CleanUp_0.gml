ds_priority_destroy(locks);
ds_priority_destroy(depth_pri);
ds_map_destroy(pressed);
ds_map_destroy(held);
ds_map_destroy(released);
ds_map_destroy(start_pressed);
ds_map_destroy(start_held);
ds_map_destroy(start_released);
ds_map_destroy(mappings);
ds_map_destroy(dev_inputs);
ds_list_destroy(all_input_names);