// Checks if game is not paused.
if (!global.paused)
{
	// Reduces the image alpha.
	image_alpha -= delta_time * 0.000001 * 4;
}

// Checks if the bullet is visable
if (image_alpha <= 0)
{
	// Destroy this instance when it leaves the room bounds.
	instance_destroy();
}