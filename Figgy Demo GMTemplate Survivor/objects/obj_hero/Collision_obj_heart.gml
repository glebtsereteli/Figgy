// Adds two hitpoints as long as its not over max.
hitpoints = min(hitpoints + 2, cfg.Health); // @Figgy: Use config.

// Chooses sound effect.
var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);

// Plays sound effect.
audio_play_sound(_sound, 0, false);

// With heart pickup.
with(other) 
{
	// Destroy pickup.
	instance_destroy();
}