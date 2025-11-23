// When an animation ends, this will check if the baddie is attacking.
if (attacking == true)
{
	// In that case, it will set 'attacking' to false to
	// end the attack.
	attacking = false;

	// Restore the path follow speed so the baddie starts following
	// its path again.
	path_speed = cfg.MoveSpeed;
}