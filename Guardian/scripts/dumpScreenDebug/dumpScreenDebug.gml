/// @desc prints some useful into for debugging screen issues

log("---- SCREEN DEBUG ---- ", current_time)
log("window:", window_get_width(), window_get_height())
log("display:", display_get_width(), display_get_height())
log("display_gui:", display_get_gui_width(), display_get_gui_height())
log("cam:", camW(), camH())
log("is_fullscreen:", window_get_fullscreen())
log("application_surface:", surface_get_width(application_surface), surface_get_height(application_surface))
log("view port:", view_wport[0], view_hport[0])
log("view port pos:", view_xport[0], view_yport[0])
log("----------------------")