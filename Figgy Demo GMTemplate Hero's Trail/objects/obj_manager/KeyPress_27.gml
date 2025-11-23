// If the game is not paused
if (!pause)
{
	// Deactivate all instances
	instance_deactivate_all(true);

	// Pause the game
	pause = true;

	// Create the pause menu sequence at the camera's position
	var camera_x = camera_get_view_x(view_camera);
	var camera_y = camera_get_view_y(view_camera);
	pause_seq = layer_sequence_create("GUI", camera_x, camera_y, seq_pause_menu);
}
// If the game is paused
else
{
	// Activate all instances
	instance_activate_all();

	// Unpause the game
	pause = false;

	// Destroy the pause sequence
	layer_sequence_destroy(pause_seq);
}