// If our hitpoints is over 0,
// AND we are not currently being hit.
if (hitpoints > 0 && sprite_index != hit_sprite)
{
	// Choose a random hit sound effect.
	var _sound = choose(snd_melee_hit_1, snd_melee_hit_2, snd_melee_hit_3);

	// Play the chosen sound.
	audio_play_sound(_sound, 0, false);

	// Set healthbar timer to 60.
	show_healthbar = 60;

	// Reduce hitpoints by the damaged caused by the swipe weapon.
	hitpoints -= global.swipe[? "damage"];

	// Create text popup to indicate damage.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);

	// Set text to damage caused.
	_text.text = -global.swipe[? "damage"];

	// Set sprite to hit sprite.
	sprite_index = hit_sprite;
	image_index = 0;

	// If hitpoints has reached zero...
	if (hitpoints <= 0)
	{
		// Destroy this instance.
		instance_destroy();
	}
}