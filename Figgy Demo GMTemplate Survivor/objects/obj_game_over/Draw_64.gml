// Set color.
// This will be a semi-transparent black.
draw_set_colour(c_black);
draw_set_alpha(0.6);

// Draw rectangle filling the screen.
draw_rectangle(0, 0, 1920, 1080, 0);

// Reset color to opaque white.
draw_set_colour(c_white);
draw_set_alpha(1);

// Draw game over banner.
draw_sprite(spr_game_over_banner, 0, 1920 / 2, 1080 / 2);

// Set font.
draw_set_font(fnt_large);

// Align drawn text horizontally and vertically.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw game over text.
draw_text(1920 / 2, 1080 / 2, "GAME OVER");

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);