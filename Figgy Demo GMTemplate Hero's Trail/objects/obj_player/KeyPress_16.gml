// If the shield energy meter is not empty
if (shield_energy > 0)
{
	// Create the shield instance
	instance_create_layer(x, y, "Instances", obj_energy_shield);
}