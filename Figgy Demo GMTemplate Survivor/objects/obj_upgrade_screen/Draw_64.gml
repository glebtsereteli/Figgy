// Draws the upgrade background.
draw_sprite(spr_ui_home_screen, 0, 1920 / 2, 1080 / 2);

// Sets the draw colour and alpha.
draw_set_colour(c_black);
draw_set_alpha(0.4);

// Draws rectangle over screen.
draw_rectangle(0, 0, 1920, 1080, 0);

// Sets the draw colour and alpha.
draw_set_colour(c_white);
draw_set_alpha(1);

// Sets the heading font.
draw_set_font(fnt_large);

// Sets the text alighnment.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draws the heading.
draw_text(1920 / 2, 175, "UPGRADE");

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);