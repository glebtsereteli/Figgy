// The shield exists
if (instance_exists(obj_energy_shield))
{
	// Reduce shield energy
	shield_energy -= cfg.Shield.UseSpeed; // @Figgy: Use config.

	// Out of shield energy
	if (shield_energy <= 0)
	{
		// Destroy shield
		instance_destroy(obj_energy_shield);
	}
}
// The shield does not exist
else
{
	// The shield energy is not full
	if (shield_energy < cfg.Shield.MaxPower) // @Figgy: Use config.
	{
		// Add some shield energy
		shield_energy += cfg.Shield.RechargeSpeed; // @Figgy: Use config.
	}
}