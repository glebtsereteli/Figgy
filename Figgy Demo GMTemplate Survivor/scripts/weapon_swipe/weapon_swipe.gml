// Create a map assigned to global.swipe
global.swipe = ds_map_create();

// Call the function to reset the swipe weapon.
// First time, this essentially setps it up.
//weapon_swipe_reset(); // @Figgy: Moved to rm_menu's Creation Code to initialize after configs.

// Define the reset function for the swipe weapon.
function weapon_swipe_reset() 
{
	// Reset swipe weapon values.
	with (CFG.Hero.Swipe.BaseStats) { // @Figgy: Use configs.
		ds_map_replace(global.swipe, "damage", Damage);
		ds_map_replace(global.swipe, "attack_speed", AttackSpeed);
		ds_map_replace(global.swipe, "unlocked", Unlocked);
	}
}

// Decalre a function to get the swipe weapon upgrades.
function weapon_swipe_upgrades(_upgrade_list) 
{
	// Get wether the swipe weapon is unlocked.
	var _unlocked = ds_map_find_value(global.swipe, "unlocked");

	// If it is NOT unlocked...
	if (!_unlocked)
	{
		// Create a map to hold the upgrade.
		var _map = ds_map_create();
	
		// Unlock this weapon.
		ds_map_replace(_map, "description", "Small but fast\narea of effect\nattack around\nthe player");
		ds_map_replace(_map, "title", "UNLOCK");
		ds_map_replace(_map, "object", global.swipe);
		ds_map_replace(_map, "key", "unlocked");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_arcing_attack_big);
		ds_map_replace(_map, "weapon_name", "SWIPE");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	
		// Exit here, because there can't possibly be any other upgrades
		// if the weapon is not unlocked.
		exit;
	}

	// Get current attack speed of swipe weapon.
	var _attack_speed = ds_map_find_value(global.swipe, "attack_speed");

	// If attack speed is over 10...
	if (_attack_speed > 10)
	{
		// Create a map to hold the upgrade.
		var _map = ds_map_create();
	
		// Increase attack speed.
		// Note that this would actually decreasing a cooldown.
		ds_map_replace(_map, "description", "Increase Attack Speed");
		ds_map_replace(_map, "title", "SPEED");
		ds_map_replace(_map, "object", global.swipe);
		ds_map_replace(_map, "key", "attack_speed");
		ds_map_replace(_map, "amount", -10);
		ds_map_replace(_map, "icon", spr_arcing_attack_big);
		ds_map_replace(_map, "weapon_name", "SWIPE");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}

	// Finds the damage value.
	var _damage = ds_map_find_value(global.swipe, "damage");

	// Checks if the value is below 5.
	if (_damage < 5)
	{
		// Create a map to hold the upgrade.
		var _map = ds_map_create();
	
		// Increment damage by 1.
		ds_map_replace(_map, "description", "Increase Damage");
		ds_map_replace(_map, "title", "DAMAGE");
		ds_map_replace(_map, "object", global.swipe);
		ds_map_replace(_map, "key", "damage");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_arcing_attack_big);
		ds_map_replace(_map, "weapon_name", "SWIPE");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}
}