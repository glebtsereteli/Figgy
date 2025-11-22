// Create a map assigned to global.trail.
global.trail = ds_map_create();

// Call the function to reset the trail weapon.
// First time, this essentially setps it up.
//weapon_trail_reset(); // @Figgy: Moved to rm_menu's Creation Code to initialize after configs.

// Define the reset function for the trail weapon.
function weapon_trail_reset() 
{
	// Unlock weapon upgrade.
	with (CFG.Hero.Trail.BaseStats) { // @Figgy: Use configs.
		ds_map_replace(global.trail, "damage", Damage);
		ds_map_replace(global.trail, "attack_speed", AttackSpeed);
		ds_map_replace(global.trail, "unlocked", Unlocked);
	}
}

// Define function to retrieve upgrades for the trail weapon.
function weapon_trail_upgrades(_upgrade_list) 
{
	// Get wether the trail weapon is unlocked.
	var _unlocked = ds_map_find_value(global.trail, "unlocked");

	// If it is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade to unlock the trail weapon.
		ds_map_replace(_map, "description", "Large but slow\narea of effect\nattack around\nthe player");
		ds_map_replace(_map, "title", "UNLOCK");
		ds_map_replace(_map, "object", global.trail);
		ds_map_replace(_map, "key", "unlocked");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_trail_attack_big);
		ds_map_replace(_map, "weapon_name", "TRAIL");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
		
		// Exits the event.
		exit;
	}

	// Get the current trail weapon attack speed.
	var _attack_speed = ds_map_find_value(global.trail, "attack_speed");

	// If attack speed is over 30...
	// Note this is a cooldown, so higher is slower.
	if (_attack_speed > 30)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase attack speed.
		ds_map_replace(_map, "description", "Increase Attack Speed");
		ds_map_replace(_map, "title", "SPEED");
		ds_map_replace(_map, "object", global.trail);
		ds_map_replace(_map, "key", "attack_speed");
		ds_map_replace(_map, "amount", -15);
		ds_map_replace(_map, "icon", spr_trail_attack_big);
		ds_map_replace(_map, "weapon_name", "TRAIL");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get current trail weapon damage.
	var _damage = ds_map_find_value(global.trail, "damage");

	// If damage is under 5...
	if (_damage < 5)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade from increasing trail weapon damage.
		ds_map_replace(_map, "description", "Increase Damage");
		ds_map_replace(_map, "title", "DAMAGE");
		ds_map_replace(_map, "object", global.trail);
		ds_map_replace(_map, "key", "damage");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_trail_attack_big);
		ds_map_replace(_map, "weapon_name", "TRAIL");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}
}