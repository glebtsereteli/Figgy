// If there wasn't a collision in the previous X position
var prev_x_col = instance_place(xprevious, y, obj_collision_parent);
if (!prev_x_col)
{
	// Then move back to that point on the X axis
	x = xprevious;
}

else
{
	// If there wasn't a collision in the previous y position
	var prev_y_col = instance_place(x, yprevious, obj_collision_parent);
	if (!prev_y_col)
	{
		// Then move back to that point on the Y axis
		y = yprevious;
	}

	else
	{
		// Otherwise just move back on both X and Y axes
		x = xprevious;
		y = yprevious;
	}
}