// If hitpoints are over zero...
// For this attack, we don't care about whether this enemy has already been hit
// so that multiple bullets from the same attack can hit it
if (hitpoints > 0)
{
	// Choose a random shooting sound effect.
	var _sound = choose(snd_lightning_impact_1, snd_lightning_impact_2);

	// Play the chosen sound.
	audio_play_sound(_sound, 0, false);

	// Destroy the other instance (the bullet)
	with (other) instance_destroy();

	// Set the healthbar timer to 60.
	// Causing the healthbar to show for 60 game steps.
	show_healthbar = 60;

	// Create text popup to indicate damage.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);

	// Set text to damage amount.
	_text.text = -global.shooting[? "damage"];

	// Set our sprite to the hit sprite.
	sprite_index = hit_sprite;
	image_index = 0;
	
	// Reduce hitpoints by the damage caused by the shooting weapon.
	hitpoints -= global.shooting[? "damage"];

	// If our hitpoints has reached zero...
	if (hitpoints <= 0)
	{
		// Destroy this instance.
		instance_destroy();
	}
}