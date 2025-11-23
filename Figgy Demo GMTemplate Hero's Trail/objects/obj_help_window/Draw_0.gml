// Draw the help scroll itself
draw_self();

// Change the font
draw_set_font(fnt_controls);

// Set the alignment to center-middle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Change the color to black
draw_set_colour(c_black);

// Draw the controls string
draw_text(x, y, controls);

// Reset the color to white (default)
draw_set_colour(c_white);

// Reset the alignment to default
draw_set_halign(fa_left);
draw_set_valign(fa_top);