/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 4FA8D836
/// @DnDComment : If there wasn't a collision$(13_10)in the previous X position
/// @DnDArgument : "x" "xprevious"
/// @DnDArgument : "y" "y"
/// @DnDArgument : "object" "obj_collision"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "obj_collision"
var l4FA8D836_0 = instance_place(xprevious, y, obj_collision);
if (!(l4FA8D836_0 > 0))
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 2BAD750C
	/// @DnDComment : Then move back to that$(13_10)point on the X axis
	/// @DnDParent : 4FA8D836
	/// @DnDArgument : "x" "xprevious"
	/// @DnDArgument : "y" "y"
	x = xprevious;
	y = y;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1B66B673
else
{
	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 4179BEC2
	/// @DnDComment : If there wasn't a collision$(13_10)in the previous y position
	/// @DnDParent : 1B66B673
	/// @DnDArgument : "x" "x"
	/// @DnDArgument : "y" "yprevious"
	/// @DnDArgument : "object" "obj_collision"
	/// @DnDArgument : "not" "1"
	/// @DnDSaveInfo : "object" "obj_collision"
	var l4179BEC2_0 = instance_place(x, yprevious, obj_collision);
	if (!(l4179BEC2_0 > 0))
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 63895481
		/// @DnDComment : Then move back to that$(13_10)point on the Y axis
		/// @DnDParent : 4179BEC2
		/// @DnDArgument : "x" "x"
		/// @DnDArgument : "y" "yprevious"
		x = x;
		y = yprevious;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6B1B2F31
	/// @DnDParent : 1B66B673
	else
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 68871C33
		/// @DnDComment : Otherwise just move back$(13_10)on both X and Y axes
		/// @DnDParent : 6B1B2F31
		/// @DnDArgument : "x" "xprevious"
		/// @DnDArgument : "y" "yprevious"
		x = xprevious;
		y = yprevious;
	}
}