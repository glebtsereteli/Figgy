// Find collision with player
var _range = cfg.DetectRange; // @Figgy: Use config.
var player_collision = collision_rectangle(x - _range, y - _range, x + _range, y + _range, obj_player, true, 1);

// Go after the player
if (player_collision)
{
	// Move towards the player at 2 pixels/second
	speed = cfg.ChaseSpeed;
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	
	// If Alarm 0 is not set, set it to run after 1 frame
	if (alarm[0] < 0)
	{
		// This alarm will shoot a projectile
		alarm[0] = 1;
	}
}
// If there is no player
else
{
	// Reset projectile shooter alarm
	alarm[0] = -1;

	// Set speed and add to direction so the bat moves in a circle
	speed = cfg.RoamSpeed; // @Figgy: Use config.
	direction += cfg.RoamSpin; // @Figgy: Use config.
}