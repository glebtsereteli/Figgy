// Draw the button itself
draw_self();

// Change the font
draw_set_font(fnt_button);

// Set the alignment to center-middle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the text on the instance
// It draws in the center since the origin of the button sprite is middle-center
draw_text(x, y,  + string(text));

// Reset the alignment to default
draw_set_halign(fa_left);
draw_set_valign(fa_top);