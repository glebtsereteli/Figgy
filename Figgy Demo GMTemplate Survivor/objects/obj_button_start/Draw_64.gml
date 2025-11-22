// Draw self, this is the button sprite.
draw_self();

// Set font.
draw_set_font(fnt_medium);

// Center align drawn text horizontally and vertically.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw start text.
draw_text_transformed(x, y + 15, "START", image_xscale, image_yscale, image_angle);

// Reset text alignments.
draw_set_halign(fa_left);
draw_set_valign(fa_top);