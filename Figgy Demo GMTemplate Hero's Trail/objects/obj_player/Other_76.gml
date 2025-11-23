// The broadcast messages for this object are set up in the player walk sprites, where each footstep
// frame has a broadcast message assigned to it.
// This action retrieves the received message from the 'event_data' map.
var message = event_data[? "message"];

// This condition checks if the received message is "step".
if (message == "step")
{
	// If it is, then the footstep sound is played.
	audio_play_sound(snd_footstep, 0, 0);
}