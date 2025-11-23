// Decide what drop to use
// By default it should be a regular collectable
var _drop = obj_collectable;

// However, there is a N% chance to replace it with a heart instead
if (random(1) < CFG.Pickups.Heart.DropChance) // @Figgy: Use config.
{
	_drop = obj_heart
}

// Create the chosen drop.
instance_create_layer(x, y, "Instances", _drop);