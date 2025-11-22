// Checks if the game is not paused to update.
if (!global.paused)
{
	// Get the distance from this instance to the hero.
	var _distance = point_distance(x, y, obj_hero.x, obj_hero.y);

	// If we are within 300 pixels,
	// OR we are already moving...
	if (_distance <= cfg.Range || speed > 0) // @Figgy: Use config.
	{
		// Get the direction from this instance to the hero.
		direction = point_direction(x, y, obj_hero.x, obj_hero.y);

		// Set speed increasingly to reach the hero.
		speed += cfg.Acceleration; // @Figgy: Use config.
	}
}
else
{
	// Sets the speed to zero.
	speed = 0;	
}