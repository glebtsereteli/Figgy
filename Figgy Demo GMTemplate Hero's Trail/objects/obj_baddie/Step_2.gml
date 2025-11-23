// If the enemy is attacking,
if(attacking == true)
{
	// Stop the event so its sprite is not changed
	exit;
}

// Get the X speed of the baddie by subtracting the current X position
// from the previous X position
var speed_x = x - xprevious;

// Get the Y speed of the baddie by subtracting the current Y position
// from the previous Y position
var speed_y = y - yprevious;

// This condition checks if the baddie is moving right
if(speed_x >= 1)
{
	// In that case we reset the horizontal scale
	image_xscale = 1;

	// and change the sprite to the side walking sprite
	sprite_index = spr_baddie_walk_side;
}

// If baddie is moving left
if(speed_x <= -1)
{
	// Set horizontal scale to -1 to flip it
	image_xscale = -1;

	// Set side walking sprite
	sprite_index = spr_baddie_walk_side;
}

// If baddie is moving down
if(speed_y >= 1)
{
	// Set that sprite
	sprite_index = spr_baddie_walk_down;
}

// If baddie is moving up
if(speed_y <= -1)
{
	// Set that sprite
	sprite_index = spr_baddie_walk_up;
}