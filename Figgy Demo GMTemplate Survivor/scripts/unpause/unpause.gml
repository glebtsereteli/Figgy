// Declare unpause function.
function unpause() 
{
	// Unpause.
	global.paused = false;

	// Apply to all instances.
	with (all) 
	{	
		// Set speed to saved speed.
		speed = paused_speed;
	
		// Set animation speed to saved value.
		image_speed = paused_animation;
	}
}