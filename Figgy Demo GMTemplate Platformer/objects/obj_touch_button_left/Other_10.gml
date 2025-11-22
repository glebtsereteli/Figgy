event_inherited();

// This block applies to obj_player.
// It runs the left function in it, causing the
// player to move left.
with (obj_player)
{
	// Sets left input flag to true
	left_input = true;
}