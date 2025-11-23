// If the shield exists, exit the event so the player is not hurt by enemies
if (instance_exists(obj_energy_shield))
{
	exit;
}

// If the invincibility power up is active
if (star_powerup_active)
{
	// Create a sword instance at the other (enemy) instance's position so it's defeated
	with (other) {
		var sword = instance_create_layer(x + 0, y + 0, "Instances", obj_sword_attack);
	
		// Make the sword invisible as we just want to attack the enemy without making the sword visible
		sword.visible = false;
	}

	// Exit the event so the player is not hurt
	exit;
}

// If Alarm 0 is deactivated
if(alarm[0] < 0)
{
	// Set the color to red to show the player has lost
	image_blend = c_red;

	// Play hurt sound
	audio_play_sound(snd_hurt, 0, 0);

	// Tell the Alarm 0 event to run after 20 frames
	// After 20 frames that event will restart the level
	alarm[0] = cfg.Knockback.Duration; // @Figgy: Use config.

	// Set the direction for the knockback so the player faces away from the enemy
	direction = point_direction(x, y, other.x, other.y) + 180;
	
	// Set the knockback speed
	speed = cfg.Knockback.Speed; // @Figgy: Use config.

	// Reduce hearts by 1
	hearts -= 1;
}