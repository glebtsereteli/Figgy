/// This event runs when the knockback is over
// Stop knockback
speed = 0;

// The player has hearts
if (hearts > 0)
{
	// Reset color
	image_blend = c_white;
}
// The player has no hearts
else
{
	// Create defeated player instance
	instance_create_layer(x + 0, y + 0, "Instances", obj_player_defeated);

	// Destroy player instance
	instance_destroy();
}