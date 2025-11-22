// If mouse is over this instance, adjusting for the GUI layer...
if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
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
	
			// Destroy pause screen object.
			with(obj_pause_screen) instance_destroy();
			
			// Call the unpause function.
			unpause();
			
			// Reset pause buttons released state.
			obj_pause_button.has_released = false;
			
			// Exit event.
			exit;
		}
	}
}
else
{
	// Reset target scale size
	target_scale = 1.0;	
}

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
	
			// Destroy pause screen object.
			with(obj_pause_screen) instance_destroy();
	
			// Destroy exit button.
			with(obj_button_exit) instance_destroy();
	
			// Destroy resume button.
			with(obj_button_resume) instance_destroy();
			
			// Reset pause buttons released state.
			obj_pause_button.has_released = false;
			
			// Exit event.
			exit;
		}
	}
}

// Checks if the escape key has been released and the ecape key is now down.
if (has_released && keyboard_check(vk_escape))
{
	// Play click sound effect.
	audio_play_sound(snd_ui_select, 0, false);
	
	// Destroy pause screen object.
	with(obj_pause_screen) instance_destroy();
	
	// Destroy exit button.
	with(obj_button_exit) instance_destroy();
	
	// Destroy resume button.
	with(obj_button_resume) instance_destroy();
	
	// Reset pause buttons released state.
	obj_pause_button.has_released = false;
	
	// Exit event.
	exit;
}
else
{
	// Checks if the escape key is currently released.
	if (!keyboard_check(vk_escape))
	{
		// Sets state to true.
		has_released = true;	
	}
}

// Lerp scale values to target scale.
image_xscale = lerp(image_xscale, target_scale, 0.1);
image_yscale = lerp(image_yscale, target_scale, 0.1);