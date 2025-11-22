// If the game is paused...
if (global.paused)
{
	// Exit this event while paused.
	exit;
}

// Execute player movement function.
player_movement();

// Execute function that keeps the player in the room.
keep_in_room();

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
depth = -y;

// Find the nearest enemy.
// And reset the distance to some high number.
nearest_enemy = instance_nearest(x, y, obj_enemy);
nearest_distance = infinity;

// If an enemy instance is found.
if (nearest_enemy)
{
	// Get the distance to that enemy.
	nearest_distance = point_distance(x, y, nearest_enemy.x, nearest_enemy.y);
}

// Reduce cooldown timer for attacks.
hero_shoot_cooldown--;
hero_swipe_cooldown--;
hero_trail_cooldown--;

// Check if function cooldown is finished.
if (hero_shoot_cooldown <= 0)
{
	// Call function.
	hero_shoot();	
}

// Check if function cooldown is finished.
if (hero_swipe_cooldown <= 0)
{
	// Call function.
	hero_swipe();	
}

// Check if function cooldown is finished.
if (hero_trail_cooldown <= 0)
{
	// Call function.
	hero_trail();	
}