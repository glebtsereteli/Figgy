// If the game is paused...
if(global.paused)
{
	// Exit event.
	exit;
}

// If the left mouse button is NOT pressed...
if (!mouse_check_button(mb_left))
{
	// Exit event.
	exit;
}

// If the mouse has clicked the pause button
else if(instance_exists(obj_pause_button))
{
	if(obj_pause_button.is_clicked)
	{
		// Exit event
		exit;
	}
}

// Draw the large joytick "back" sprite at the anchor point.
draw_sprite(spr_joystick_big, 0, global.mouse_anchor_x, global.mouse_anchor_y);

// Get the distance from the anchor point
// to the current mouse position.
var _dist = min(point_distance(global.mouse_anchor_x, global.mouse_anchor_y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)), 100);

// Draw the joystick "thumb".
draw_sprite(spr_joystick_small, 0, global.mouse_anchor_x + lengthdir_x(_dist, direction), global.mouse_anchor_y + lengthdir_y(_dist, direction));