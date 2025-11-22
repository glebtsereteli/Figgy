// Define function to execute a swipe attack.
function swipe_attack() 
{
	// If any enemy was found...
	if (nearest_enemy)
	{
		// Play attack sound effect.
		audio_play_sound(snd_attack_chimes_1, 0, false);
	
		// Create the swipe attack object.
		instance_create_layer(x, y, "Instances", obj_hero_swipe);
	}
}