// Declare a function to set up the next wave.
function next_wave() 
{
	// Subtract experience goal from current experience.
	// Basically this is the cost of levelling up.
	global.xp -= global.xp_goal;

	// Increase the experience goal for the next wave.
	global.xp_goal = floor(global.xp_goal * 1.2);

	// Decrease the time it takes to spawn enemies.
	global.enemy_spawn_speed -= 3;

	// Increase enemy health bonus, making all enemies slightly harder to kill each wave.
	global.enemy_health_bonus = global.enemy_health_bonus * 1.25;
}