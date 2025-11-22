// Increment experience.
global.xp += 1;

// Choose a random pickup sound effect.
var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);

// Play the chosen sound.
audio_play_sound(_sound, 0, false);

// Apply the follow actions to the other object 
// (the collectible).
with(other) 
{
	// Destroy the collectible.
	instance_destroy();
}