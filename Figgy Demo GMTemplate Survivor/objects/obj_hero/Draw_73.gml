// Draw the back of the healthbar.
draw_sprite_ext(spr_healthbar_back, 0, x - 50, y + 5, 100 / 29, 26 / 26, 0, c_white, 1);

// Draw the healthbar "filling".
draw_sprite_ext(spr_healthbar_fill, 0, x - 46, y + 9, 4 * (hitpoints / cfg.Health), 0.9, 0, c_white, 1); // @Figgy: Use config.