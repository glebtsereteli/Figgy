// Move at 4 pixels/second
//speed = 4; // @Figgy: Set on creation from obj_bat's Alarm 0.

// If the player exists,
if(instance_exists(obj_player))
{
	// Change direction so projectile moves towards the player
	direction = point_direction(x, y, obj_player.x, obj_player.y);

	// Change image angle to match movement direction
	image_angle = direction;
}