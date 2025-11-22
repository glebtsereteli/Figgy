// If the hero is NOT currently being hit...
if (sprite_index != spr_hero_hit)
{
	// Reduce hitpoints.
	hitpoints -= other.cfg.Damage; // @Figgy: Use config.

	// Create a text popup.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);
	// Set text for popup.
	_text.text = 1;
	// Set colour for popup.
	_text.color = c_red;
	
	// Change sprite index to hit.
	sprite_index = spr_hero_hit;
	// Reset image index.
	image_index = 0;
	
	// With the enemy...
	with (other) 
	{
		// Check if enemy is walking pigun.
		if (sprite_index == spr_pigun_walk)
		{
			// Change to attack sprite.
			sprite_index = attack_sprite;
			// Reset image index.
			image_index = 0;
		}
	}
}