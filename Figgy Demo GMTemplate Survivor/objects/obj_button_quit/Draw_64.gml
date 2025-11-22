// Set frame.
image_index = 1;

// Draw self, this is the button sprite.
draw_self();

// Draw the exit icon.
draw_sprite_ext(spr_exit_button, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);