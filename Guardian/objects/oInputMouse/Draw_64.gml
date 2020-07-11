switch(mouse_type){
case MOUSE_TYPE.mobile: draw_set_color(c_blue); break;
case MOUSE_TYPE.desktop: draw_set_color(c_green); break;
case MOUSE_TYPE.tab: draw_set_color(c_orange); break;
}
draw_set_alpha(.5);
draw_circle(gui_x,gui_y,held?60:30,false);
draw_set_alpha(1);