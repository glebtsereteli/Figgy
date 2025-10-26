/// @desc Methods

MoveCollide = function() {
	repeat (abs(xSpd)) {
	    if (place_meeting(x + sign(xSpd), y, colliders)) {
	        xSpd = 0;
	        break;
			
		}
		x += sign(xSpd);
	}
	
	repeat (abs(ySpd)) {
	    if (place_meeting(x, y + sign(ySpd), colliders)) {
	        ySpd = 0;
	        break;
		}
		y += sign(ySpd);
	}
};
IsGrounded = function() {
	return place_meeting(x, y + 1, colliders);
};
