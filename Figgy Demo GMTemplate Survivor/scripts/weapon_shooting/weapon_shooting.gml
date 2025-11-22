// Create map to store the shooting weapon data.
global.shooting = ds_map_create();

// Call function to reset the shooting weapon state.
//weapon_shooting_reset(); // @Figgy: Moved to rm_menu's Creation Code to initialize after configs.

// Define the function to reset the shooting weapon state.
function weapon_shooting_reset() 
{
	// Shooting weapon bases stats.
	// Shooting weapon starts unlocked as it's the first weapon.
	with (CFG.Hero.Shooting.BaseStats) { // @Figgy: Use configs.
		ds_map_replace(global.shooting, "damage", Damage);
		ds_map_replace(global.shooting, "attack_speed", AttackSpeed);
		ds_map_replace(global.shooting, "number_of_shots", NumberOfShots);
		ds_map_replace(global.shooting, "unlocked", Unlocked);
	}
}

// Define function to retrieve list of available shooting
// weapon upgrades.
function weapon_shooting_upgrades(_upgrade_list) 
{
	// Get wether the shooting weapon is unlocked.
	var _unlocked = ds_map_find_value(global.shooting, "unlocked");

	// If the shooting weapon is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to unlock shooting weapon.
		ds_map_replace(_map, "description", "Unlock Shooting\nWeapon");
		ds_map_replace(_map, "title", "UNLOCK");
		ds_map_replace(_map, "object", global.shooting);
		ds_map_replace(_map, "key", "unlocked");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	
		// Exits the event.
		exit;
	}

	// Get current shooting weapon attack speed.
	var _attack_speed = ds_map_find_value(global.shooting, "attack_speed");

	// If attack speed is over 5...
	if (_attack_speed > 5)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase attack speed of shooting weapon.
		ds_map_replace(_map, "description", "Increase Attack Speed");
		ds_map_replace(_map, "title", "SPEED");
		ds_map_replace(_map, "object", global.shooting);
		ds_map_replace(_map, "key", "attack_speed");
		ds_map_replace(_map, "amount", -5);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get the current number of shots...
	var _number_of_shots = ds_map_find_value(global.shooting, "number_of_shots");

	// If the number of shots is under 7...
	if (_number_of_shots < 7)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase the number of shots
		// from the shooting weapon.
		ds_map_replace(_map, "description", "Number of shots +2");
		ds_map_replace(_map, "title", "BARRAGE");
		ds_map_replace(_map, "object", global.shooting);
		ds_map_replace(_map, "key", "number_of_shots");
		ds_map_replace(_map, "amount", 2);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get current shooting weapon damage.
	var _damage = ds_map_find_value(global.shooting, "damage");

	// If damage is under 4...
	if (_damage < 4)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase damage.
		ds_map_replace(_map, "description", "Increase Damage");
		ds_map_replace(_map, "title", "DAMAGE");
		ds_map_replace(_map, "object", global.shooting);
		ds_map_replace(_map, "key", "damage");
		ds_map_replace(_map, "amount", 0.4);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}
}