// If no power up is active
if (!powerup_active)
{
	// Enable power up variable
	powerup_active = true;
	
	var _cfg = cfg.Powerups.Speed; // @Figgy: Use configs.
	
	// Double movement & animation speed
	move_speed = cfg.MoveSpeed * _cfg.SpeedMultiplier; // @Figgy: Use config.
	image_speed = _cfg.SpeedMultiplier; // @Figgy: Use config.

	// Run alarm 1 after 300 steps to deactivate power up
	alarm[1] = floor(_cfg.Duration * game_get_speed(gamespeed_fps));

	// Change color
	image_blend = _cfg.Color; // @Figgy: Use config.

	// Destroy the other instance (the pickup) and create a particle effect
	with (other) {
		instance_destroy();
		
		effect_create_above(ef_ring, x, y, 1, _cfg.Color); // @Figgy: Use config.
	}
}