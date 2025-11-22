// Decide what drop to use
// By default it should be a regular collectable
var _drop = obj_collectable;

// However, there is a 1/10 chance to replace it with a heart instead
// Because computers start countin at 0, the maximum value must be 9 for a 1/10 chance
if(irandom(9) == 0)
{
	_drop = obj_heart
}

// Create the chosen drop.
instance_create_layer(x, y, "Instances", _drop);