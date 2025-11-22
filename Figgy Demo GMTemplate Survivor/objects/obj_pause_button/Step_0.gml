// Checks no menus are showing.
if (!global.paused)
{
	// Stores how many gamepad count.
	var _max_pads = gamepad_get_device_count();

	// Checks when at least 1 gamepad is present.
	if (_max_pads > 0)
	{
		// Checks the gamepad is connected.
		if (gamepad_is_connected(0))
		{
			// Checks if gamepad button has been pressed.
			if (gamepad_button_check_pressed(0, gp_start))
			{
				// Play click sound effect.
				audio_play_sound(snd_ui_select, 0, false);
		
				// Create pause screen.
				instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
				// Call the pause function.
				pause();
				
				// Sets released state to false.
				has_released = false;
				
				// Ends event.
				exit;
			}
		}
	}
	
	// Checks if the escape key has been released and the ecape key is now down.
	if (has_released && keyboard_check(vk_escape))
	{
		// Play click sound effect.
		audio_play_sound(snd_ui_select, 0, false);
		
		// Create pause screen.
		instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
		// Call the pause function.
		pause();
		
		// Sets released state to false.
		has_released = false;
		
		// Ends event.
		exit;
	}
	else
	{
		// Checks if escape key is not pressed.
		if (!keyboard_check(vk_escape))
		{
			// Sets released state to true.
			has_released = true;	
		}
	}
	
	// If mouse is over this instance, adjusting for the GUI layer...
	if(device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
	{
		// Reduce target scale size.
		target_scale = 0.95;
		
		// If left mouse button is pressed...
		if (mouse_check_button_pressed(mb_left))
		{
			// Play click sound effect.
			audio_play_sound(snd_click, 0, false);
			
			// Sets click state to true.
			is_clicked = true;
			
			// Reduce target scale size further.
			target_scale = 0.9;
		}
	
		// Checks if mouse has been clicked on this button.
		if (is_clicked)
		{
			// Reduce target scale size further.
			target_scale = 0.9;
			
			// If left mouse button is released.
			if (mouse_check_button_released(mb_left))
			{
				// Play click sound effect.
				audio_play_sound(snd_ui_select, 0, false);
		
				// Create pause screen.
				instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_pause_screen);
		
				// Call the pause function.
				pause();
				
				// Ends event.
				exit;
			}
		}
	}
	else
	{
		// Sets click state to false.
		is_clicked = false;
		
		// Reset target scale size
		target_scale = 1.0;	
	}
	
	// Lerp scale values to target scale.
	image_xscale = lerp(image_xscale, target_scale, 0.1);
	image_yscale = lerp(image_yscale, target_scale, 0.1);
}