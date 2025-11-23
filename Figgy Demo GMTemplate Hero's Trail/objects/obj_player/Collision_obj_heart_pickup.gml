// If the player does not have all of its hearts
if (hearts < cfg.MaxHearts) // @Figgy: Use config.
{
	// Add 1 heart
	hearts += 1;
	
	// Play the power up sound
	audio_play_sound(snd_powerup, 0, 0);

	// Destroy the other instance (the pickup)
	with (other) {
		instance_destroy();
		
		// Create an effect
		effect_create_above(ef_ring, x, y, 0, $FF3838FF);
	}
}