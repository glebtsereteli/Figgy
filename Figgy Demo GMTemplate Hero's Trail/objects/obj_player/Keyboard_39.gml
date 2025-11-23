// Add move_speed to X so it moves right
x += move_speed;

// Walk to side sprite
sprite_index = spr_player_walk_side;

// Reset the horizontal scale to 1 so the player faces right again
image_xscale = 1;

// Set input direction to 0 (right)
input_direction = 0;