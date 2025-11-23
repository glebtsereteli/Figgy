cfg = CFG.Hero; // @Figgy: Store the Hero config struct to use throughout the object.

// Set the maximum hitpoints that the player can have.
//hitpoints_max = 10; // @Figgy: Using config instead.

// Set the starting hitpoints of the player (to the max).
hitpoints = cfg.Health; // @Figgy: Use config.

// Variables for tracking enemies.
nearest_enemy = undefined;
nearest_distance = infinity;

// Cooldowns for the weapon attacks (from frames to seconds).
hero_shoot_cooldown = 1;
hero_swipe_cooldown = 1;
hero_trail_cooldown = 1;

// Function for the shooting weapon.
hero_shoot = function()
{
	// If the nearest enemy is within 1000 pixels...
	if (nearest_distance < cfg.Shooting.Range) // @Figgy: Use config.
	{
		// Reset the cooldown for this weapon.
		hero_shoot_cooldown = max(global.shooting[? "attack_speed"], 1);
		
		// If this weapon is unlocked...
		if (global.shooting[? "unlocked"])
		{
			// Execute the function to handle this weapon.
			shooting_attack();
		}
	}
	// The nearest enemy is too far away, but we don't want to fully reset the cooldown...
	else
	{
		// Set the cooldown to test again next frame.
		hero_shoot_cooldown = 1;
	}
}

// Function for the swiping weapon
hero_swipe = function()
{
	// If the nearest enemy is within 250 pixels...
	if (nearest_distance < cfg.Swipe.Range) // @Figgy: Use config.
	{
		// Reset the cooldown for this weapon.
		hero_swipe_cooldown = max(global.swipe[? "attack_speed"], 1);

		// If this weapon is unlocked...
		if (global.swipe[? "unlocked"])
		{
			// Execute the function that handles this weapon.
			swipe_attack();
		}
	}
	// The nearest enemy is too far away, but we don't want to fully reset the cooldown...
	else
	{
		// Set the cooldown to test again next frame.
		hero_swipe_cooldown = 1;
	}
}

// Function for the trail weapon
hero_trail = function()
{
	// If the nearest enemy is within 300 pixels...
	if (nearest_distance < cfg.Trail.Range) // @Figgy: Use config.
	{
		// Reset the cooldown for this weapon.
		hero_trail_cooldown = max(global.trail[? "attack_speed"], 1);

		// If this weapon is unlocked...
		if(global.trail[? "unlocked"])
		{
			// Execute the function that handles the weapon.
			attack_trail();
		}
	}

	// The nearest enemy is too far away, but we don't want to fully reset the cooldown...
	else
	{
		// So set the cooldown to test again next frame.
		hero_trail_cooldown = 1;
	}
}

// Create shadow object to follow.
var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;