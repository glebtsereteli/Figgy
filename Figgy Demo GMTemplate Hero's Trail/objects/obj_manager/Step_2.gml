// The action below will apply to ALL instances in the room
with(all) {
	// Set the instance's depth to negative bbox_bottom
	// bbox_bottom is the Y coordinate at the bottom edge of an instance's mask
	// That point is used for depth-sorting these instances
	depth = -bbox_bottom;
}