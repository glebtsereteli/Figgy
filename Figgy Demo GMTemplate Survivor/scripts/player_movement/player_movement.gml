// Create variables for the mouse anchor position.
global.mouse_anchor_x = 0;
global.mouse_anchor_y = 0;

// Declare player movement script.
function player_movement() 
{
	// Set speed to 0.
	// We increase it again below.
	hspeed = 0;
	vspeed = 0;
	
	// If the left mouse button is pressed...
	if (mouse_check_button_pressed(mb_left) and not is_mouse_over_debug_overlay()) // @Figgy: Debug Overlay blocks mouse movement.
	{
		// Set the anchor point to the current mouse position.
		global.mouse_anchor_x = device_mouse_x_to_gui(0);
		global.mouse_anchor_y = device_mouse_y_to_gui(0);
	}

	// If the left mouse button is held down...
	if (mouse_check_button(mb_left) and not is_mouse_over_debug_overlay()) // @Figgy: Debug Overlay blocks mouse movement.
	{
		// If the button is active.
		if (instance_exists(obj_pause_button))
		{
			// If the pause button is not clicked.
			if (!obj_pause_button.is_clicked)
			{
				// Set horizontal and vertical speeds based
				// on the difference between the current mouse
				// poisition and the anchor position.
				hspeed = (device_mouse_x_to_gui(0) - global.mouse_anchor_x) * 0.1;
				vspeed = (device_mouse_y_to_gui(0) - global.mouse_anchor_y) * 0.1;
			}
		}
	}

	// If left mouse button is NOT held down...
	else
	{
		// Stores how many gamepad count.
		var _max_pads = gamepad_get_device_count();

		// Checks when at least 1 gamepad is present.
		if (_max_pads > 0)
		{
			// Checks the gamepad is connected.
			if (gamepad_is_connected(0))
			{
				// Sets the gamepads deadzone.
			    gamepad_set_axis_deadzone(0, 0.1);
				
				// Checks if the gamepads right stick is moved.
				if (gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axislh) != 0)
				{
					// Adds movement speed to player based on left stick input.
					vspeed += cfg.Speed * gamepad_axis_value(0, gp_axislv); // @Figgy: Use config.
					hspeed += cfg.Speed * gamepad_axis_value(0, gp_axislh); // @Figgy: Use config.
				}
			}
		}
		
		// If the W key is down...
		if (keyboard_check(ord("W")))
		{
			// Add -10 to vertical speed.
			vspeed += -cfg.Speed; // @Figgy: Use config.
		}
	
		// If the S key is down...
		if (keyboard_check(ord("S")))
		{
			// Add 10 to vertical speed.
			vspeed += cfg.Speed; // @Figgy: Use config.
		}
	
		// If the A key is down...
		if (keyboard_check(ord("A")))
		{
			// Add -10 to horizontal speed.
			hspeed += -cfg.Speed; // @Figgy: Use config.
		}
	
		// If the D key is down...
		if (keyboard_check(ord("D")))
		{
			// Add 10 to horizontal speed.
			hspeed += cfg.Speed; // @Figgy: Use config.
		}
	}

	// Normalize hspeed and vspeed
	var _speed = sqrt(sqr(hspeed) + sqr(vspeed));
	if (_speed > cfg.Speed)
	{
		hspeed *= cfg.Speed / _speed; // @Figgy: Use config.
		vspeed *= cfg.Speed / _speed; // @Figgy: Use config.
	}

	// If hspeed does not equal 0...
	if (hspeed != 0)
	{
		// Flip sprite horizontally based on hspeed.
		image_xscale = sign(hspeed);
	}

	// If sprite is not the hit sprite,
	// meaning the hero isn't currently being hit...
	if (sprite_index != spr_hero_hit)
	{
		// If speed is over 0...
		if (hspeed != 0 || vspeed != 0)
		{
			// Set sprite to the running sprite.
			sprite_index = spr_hero_run;
		}
	
		// Else speed is 0...
		else
		{
			// Set sprite to the idle sprite.
			sprite_index = spr_hero_idle;
		}
	}
}