// Sets the texts font.
draw_set_font(fnt_small);

// Reset text alignments
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Sets the alpha for the text.
draw_set_alpha(image_alpha);

// Draw the text.
draw_text(x, y, string(abs(floor(text * 100))));

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Reset color to opaque.
draw_set_alpha(1);