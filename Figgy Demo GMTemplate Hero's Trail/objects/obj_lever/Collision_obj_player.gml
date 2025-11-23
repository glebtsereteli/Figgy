// Check if the player pressed E
if (keyboard_check_pressed(ord("E")))
{
	// If the lever is on its first frame (meaning it's untouched)
	if (image_index == 0)
	{
		// Move to its second frame
		image_index = 1;
		
		// Play the lever pull sound
		audio_play_sound(snd_lever_pull, 0, 0);
		
		// Play the gate open sound
		audio_play_sound(snd_gate_iron_open, 0, 0);
		
		// Set the gate's image speed to 1 so it animates and opens up
		gate_to_open.image_speed = 1;
	}
}