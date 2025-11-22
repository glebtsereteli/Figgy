// Declare a function that retrieves all possible upgrades
// and creates upgrade card objects for 3 of them.
function get_upgrades() 
{
	// Destroy any existing upgrade cards.
	with(obj_upgrade)
	{
		// Destroy object.
		instance_destroy();
	}

	// Create a new list to hold possible upgrades.
	var _upgrade_list = ds_list_create();

	// Get upgrades for the shooting weapon and place them in the list.
	weapon_shooting_upgrades(_upgrade_list);

	// Get upgrades for the swipe weapon and place them in the list.
	weapon_swipe_upgrades(_upgrade_list);

	// Get upgrades for the trail weapon and place them in the list.
	weapon_trail_upgrades(_upgrade_list);

	// Shuffle the list containing all the retrieved upgrades.
	ds_list_shuffle(_upgrade_list);

	// Get the size of the list, this
	// is how many upgrades are in it.
	var _size = ds_list_size(_upgrade_list);

	// Define the x position where the first upgrade card
	// will be created.
	var _x = -400;

	// For each upgrade in the list,
	// up to a max of 3...
	for (var _index = 0; _index < min(_size, 3); _index += 1)
	{
		// Get the upgrade at the current index.
		_upgrade_data = ds_list_find_value(_upgrade_list, _index);
	
		// Create a new upgrade card object.
		var _upgrade = instance_create_layer(1920 / 2 + _x, 1080 / 2, "UpgradeScreen", obj_upgrade);
		
		// Set the reveal covering life.
		_upgrade.roll_life = 0.5 + 0.25 * _index;
	
		// Set the upgrade data to the upgrade card object.
		_upgrade.upgrade_data = _upgrade_data;
	
		// Increment the x position for the next card.
		_x += 400;
	}
	
	// Destroy the list to avoid a memory leak
	ds_list_destroy(_upgrade_list);
}