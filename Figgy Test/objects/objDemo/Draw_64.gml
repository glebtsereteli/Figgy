
// Back frame
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 450, display_get_gui_height(), false);
draw_set_color(c_white);
draw_set_alpha(1);

// Recursive config tree
DrawConfig(Figgy.GetCurrent(), 16, 27);
