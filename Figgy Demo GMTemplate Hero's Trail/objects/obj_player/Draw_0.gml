draw_self();

// If the player is able to move faster than the default speed
if (move_speed > cfg.MoveSpeed) // @Figgy: Use config.
{
	// Draw a trailing frame behind it
	var _cfg = cfg.FastTrail; // @Figgy: Use configs.
	var _xScale = image_xscale * _cfg.Scale;
	var _yScale = image_yscale * _cfg.Scale;
	draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, _xScale, _yScale, 0, _cfg.Color, _cfg.Alpha);
}