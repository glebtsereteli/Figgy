/// @desc Methods

MoveCollide = function() {
	xSpdFrac += xSpd;
	ySpdFrac += ySpd;
	var _xSpd = round(xSpdFrac);
	var _ySpd = round(ySpdFrac);
	xSpdFrac -= _xSpd;
	ySpdFrac -= _ySpd;
	
	repeat (abs(_xSpd)) {
	    if (place_meeting(x + sign(_xSpd), y, colliders)) {
	        xSpd = 0;
	        break;
			
		}
		x += sign(_xSpd);
	}
	
	repeat (abs(_ySpd)) {
	    if (place_meeting(x, y + sign(_ySpd), colliders)) {
	        ySpd = 0;
	        break;
		}
		y += sign(_ySpd);
	}
};
IsGrounded = function() {
	return place_meeting(x, y + 1, colliders);
};
