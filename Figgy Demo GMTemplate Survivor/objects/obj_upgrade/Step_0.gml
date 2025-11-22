// Reset mouse_over to false, this will hide
// the glow effect on the card when drawing.
mouse_over = false;

// Stores how many gamepad count.
var _max_pads = gamepad_get_device_count();

// Checks when at least 1 gamepad is present.
if (_max_pads > 0)
{
	// Checks the gamepad is connected.
	if (gamepad_is_connected(0))
	{
		// Sets the gamepads deadzone.
		gamepad_set_axis_deadzone(0, 0.5);
		
		// Checks if the gamepads left stick is moved.
		if (gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axislh) != 0)
		{
			// Checks if the upgrade is on the left side.
			if (x < 1920 / 2)
			{
				// Checks if the controller axis is pointing left.
				if (gamepad_axis_value(0, gp_axislh) < -0.5)
				{
					// Sets the upgrade to glow.
					mouse_over = true;
					// Tells the other upgrades a controller has been used.
					global.is_mouse = false;	
				}
			}
			// Checks if on the right side.
			else if (x > 1920 / 2)
			{
				// Checks if the controller axis is pointing right.
				if (gamepad_axis_value(0, gp_axislh) > 0.5)
				{
					// Sets the upgrade to glow.
					mouse_over = true;
					// Tells the other upgrades a controller has been used.
					global.is_mouse = false;		
				}
			}
			else
			{
				// Checks if the controller is pointing up.
				if (gamepad_axis_value(0, gp_axislv) < -0.5)
				{
					// Checks if controller is not pointing too much left or right
					if (gamepad_axis_value(0, gp_axislh) > -0.5 && gamepad_axis_value(0, gp_axislh) < 0.5)
					{
						// Sets the upgrade to glow.
						mouse_over = true;
						// Tells the other upgrades a controller has been used.
						global.is_mouse = false;	
					}
				}
			}
		}
		else
		{
			// Tells variable controller isn't being used.
			global.is_mouse = true;	
		}
		
		// Checks if gamepad button has been pressed.
		if (gamepad_button_check_pressed(0, gp_face1))
		{
			// Upgrade has detected a click.
			is_clicked = true;
			// Click was done with gamepad.
			gamepad_bypass = true;
		}
	}
	else
	{
		// Tells upgrades no controllers available.
		global.is_mouse = true;	
	}
}
else
{
	// Tells upgrades no controllers available.
	global.is_mouse = true;
}

// If the mouse is over this card...
if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom && global.is_mouse)
{
	// Set mouse_over to true, to enable
	// the purple glow.
	mouse_over = true;
}

// Checks if reveal effect if visible.
if (roll_alpha >= 0)
{
	// Stops select highlight from occuring.
	mouse_over = false;
	
	// Decreases life timer.
	roll_life -= delta_time * 0.000001;
	
	// Checks if life timer is finished
	if (roll_life <= 0)
	{
		// Reduces alpha of upgrade reveal.
		roll_alpha -= delta_time * 0.000001 * 2;
	}
}

// Checks if upgrade is highlighted.
if (mouse_over)
{
	// If the left mouse button has been pressed...
	if (mouse_check_button_pressed(mb_left))
	{
		// Play upgrade sound effect.
		audio_play_sound(snd_click, 0, false);
		
		// Sets click state to true.
		is_clicked = true;
	}
	
	// Checks if mouse has been clicked on this button.
	if (is_clicked)
	{
		// Checks for mouse release or gamepad bypass.
		if (mouse_check_button_released(mb_left) || gamepad_bypass)
		{
			// Play select sound.
			audio_play_sound(snd_ui_select, 0, false);
	
			// Set variables for upgrade stats.
			var _object = ds_map_find_value(upgrade_data, "object");
			var _key = ds_map_find_value(upgrade_data, "key");
			var _amount = ds_map_find_value(upgrade_data, "amount");
	
			// Upgrade components stats.
			_object[? _key] += _amount;
	
			// Destroys upgrades.
			with(obj_upgrade) instance_destroy();
	
			// Destroys upgrade screen.
			with(obj_upgrade_screen) instance_destroy();
	
			// Destroys reroll button.
			with(obj_button_reroll) instance_destroy();
	
			// Plays music sound effect.
			audio_play_sound(snd_music_game, 0, true);
		}
	}
}