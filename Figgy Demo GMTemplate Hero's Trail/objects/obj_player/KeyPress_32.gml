// If the shield exists, exit the event so the player can't attack
if (instance_exists(obj_energy_shield))
{
	exit;
}

// Create a sword instance
var sword = instance_create_layer(x, y, "Instances", obj_sword_attack);

// Set its image angle to the input direction so the sword faces in the same direction as the player
sword.image_angle = input_direction;

// Play the sword swing sound
audio_play_sound(snd_sword_swing, 0, 0);