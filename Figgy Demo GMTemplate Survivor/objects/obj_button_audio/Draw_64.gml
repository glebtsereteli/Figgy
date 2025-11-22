// Set frame based on current volume.
image_index = audio_get_master_gain(0) > 0;

// Draw self, this is the button sprite.
draw_self();

// Draw the little speaker icon.
draw_sprite_ext(spr_sound_button, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);