// If no power up is active
if (!powerup_active)
{
	// Enable power up variable and star power up variable
	powerup_active = true;
	star_powerup_active = true;
	
	var _cfg = cfg.Powerups.Invincibility; // @Figgy: Use configs.
	
	// Increase movement & animation speed by 50%
	move_speed = cfg.MoveSpeed * _cfg.SpeedMultiplier; // @Figgy: Use config.
	image_speed = _cfg.SpeedMultiplier; // @Figgy: Use config.

	// Change color
	image_blend = _cfg.Color; // @Figgy: Use config.

	// Run alarm 1 after 600 steps to deactivate power up
	alarm[1] = floor(_cfg.Duration * game_get_speed(gamespeed_fps));

	// Destroy the other instance (the pickup) and create a particle effect
	with (other) {
		instance_destroy();
		
		effect_create_above(ef_ring, x, y, 1, _cfg.Color);
	}

	// Pause the game music
	audio_pause_sound(snd_music_game);

	// Play the rampage music
	audio_play_sound(snd_music_rampage, 0, 1);
}