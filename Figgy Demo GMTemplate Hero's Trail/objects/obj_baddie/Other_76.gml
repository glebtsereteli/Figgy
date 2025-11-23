// The broadcast messages for this object are set up in the baddie walk sprites, where each footstep
// frame has a broadcast message assigned to it. This code retrieves the message received from the
// event_data map.
var message = event_data[? "message"];

// This condition checks if the received message is "baddie_step".
if (message == "baddie_step")
{
	// This condition checks that the enemy is not attacking, and the player instance exists.
	if (!attacking && instance_exists(obj_player))
	{
		// Get the distance from this baddie instance to the player.
		var distance = point_distance(x, y, obj_player.x, obj_player.y);
	
		// If the distance to the player is less than 600,
		if (distance < 600)
		{
			// This plays the baddie footstep.
			// It uses audio_play_sound_at() to play sound at the enemy's coordinates.
			audio_play_sound_at(snd_baddie_footstep, x, y, 0, 200, 600, 1, 0, 0);
		}
	}
}