// If the hero exists...
if (instance_exists(obj_hero))
{
	// Jump to the hero, essentially locking
	// our position to the hero position at an offset.
	x = obj_hero.x;
	y = obj_hero.y - 40;
}