// Declare a function to set up the next wave.
function next_wave() 
{
	// Subtract experience goal from current experience.
	// Basically this is the cost of levelling up.
	global.xp -= global.xp_goal;

	// Increase the experience goal for the next wave.
	global.xp_goal = floor(global.xp_goal * cfg.XPGoal.Increase); // @Figgy: Use config.

	// Decrease the time it takes to spawn enemies.
	global.enemy_spawn_speed -= cfg.Enemies.SpawnInterval.Decrease; // @Figgy: Use config.

	// Increase enemy health bonus, making all enemies slightly harder to kill each wave.
	global.enemy_health_bonus *= cfg.Enemies.HealthBonus.Decrease; // @Figgy: Use config.
}