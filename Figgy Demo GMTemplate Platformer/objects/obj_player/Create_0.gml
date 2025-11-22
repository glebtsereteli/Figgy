// This runs the Create event of the parent, ensuring the player gets all variables from the character parent.
event_inherited();

// This variable stores the number of coins the player has collected.
coins = 0;

// This variable tells whether the player is currently in knockback (from being hit by an enemy). It will be true if it is, and false if not.
in_knockback = false;

// This is the object that replaces the player once it is defeated.
defeated_object = obj_player_defeated;

// Flag for if a jump is detected
jump_input = false;

// Function to be called when a player jumps
player_jump = function()
{
	// This checks if the 'grounded' variable is true, meaning the player is standing on the ground, and can jump.
	if (grounded)
	{
		// This sets the Y velocity to negative jump_speed, making the player immediately jump upwards. It
		// will automatically be brought down by the gravity code in the parent's Begin Step event.
		vel_y = -cfg.JumpSpeed;

		// This changes the player's sprite to the jump sprite, and resets the frame to 0.
		sprite_index = spr_player_jump;
		image_index = 0;

		// This sets 'grounded' to false, so that any events after this know that the player is not supposed
		// to be on the ground anymore.
		grounded = false;

		// This creates an instance of obj_effect_jump at the bottom of the player's mask. This is the
		// jump VFX animation.
		instance_create_layer(x, bbox_bottom, "Instances", obj_effect_jump);
	
		// Play the jump sound with a random pitch
		var _sound = audio_play_sound(snd_jump, 0, 0);
		audio_sound_pitch(_sound, random_range(0.8, 1));
	}
	
	// Sets jump flag back to false
	jump_input = false;
}

// Flag for if a left input is detected
left_input = false;

// Function to be called when a player goes left
player_left = function()
{
	// This checks if the player is currently in knockback, after being hit by an enemy.
	if (in_knockback)
	{
		// In that case we return
		return;
	}

	// Set the X velocity to negative move_speed.
	// This makes the character move left.
	vel_x = -cfg.MoveSpeed;

	// This checks if the current sprite is the fall sprite, meaning the player hasn't landed yet.
	if (sprite_index == spr_player_fall)
	{
		// In that case we return
		return;
	}

	// This checks if the player is on the ground, before changing the sprite to the walking sprite. This is
	// done to ensure that the walking sprite does not active while the player is in mid-air.
	if (grounded)
	{
		// Change the instance's sprite to the walking player sprite.
		sprite_index = spr_player_walk;
	}
	
	// Sets input flag back to false
	left_input = false;
}

// Flag for if a right input is detected
right_input = false;

// Function to be called when a player goes right
player_right = function()
{
	// This checks if the player is currently in knockback, after being hit by an enemy.
	if (in_knockback)
	{
		// In that case we return
		return;
	}

	// Set the X velocity to move_speed.
	// This makes the character move right.
	vel_x = cfg.MoveSpeed;

	// This checks if the current sprite is the fall sprite, meaning the player hasn't landed yet.
	if (sprite_index == spr_player_fall)
	{
		// In that case we return
		return;
	}

	// This checks if the player is on the ground, before changing the sprite to the walking sprite. This is
	// done to ensure that the walking sprite does not active while the player is in mid-air.
	if (grounded)
	{
		// Change the instance's sprite to the walking player sprite.
		sprite_index = spr_player_walk;
	}
	
	// Sets input flag back to false
	right_input = false;
}