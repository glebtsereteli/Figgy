// This draws the chest itself
draw_self();

// This checks if the chest is locked
if (locked)
{
	// This draws the key sprite with a lower alpha so it
	// looks slightly transparent
	// The Y is set to 'y - 55' meaning the key is drawn
	// 55 pixels above the chest
	draw_sprite_ext(spr_key, 0, x, y - 55, 1, 1, 0, c_white, 0.6);
}