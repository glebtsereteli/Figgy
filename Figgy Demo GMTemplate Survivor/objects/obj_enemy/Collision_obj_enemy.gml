// Get direction from this instance to the other.
var _direction = point_direction(x, y, other.x, other.y);

// Push away from the other instance.
x += lengthdir_x(-1, _direction);
y += lengthdir_y(-1, _direction);