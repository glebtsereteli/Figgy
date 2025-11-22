// Check if owner is set and exists.
if (owner_object != noone && instance_exists(owner_object))
{
	// Update position to owners position with any offsets.
	x = owner_object.x + shadow_offset_x;
	y = owner_object.y + shadow_offset_y;
}
else
{
	// Destroy object.
	instance_destroy();	
}