// Get random relative X/Y for particle effect
var relative_x = random_range(-5, 5);
var relative_y = random_range(-5, 5);

// Create effect
effect_create_above(ef_spark, x + relative_x, y + relative_y, 0, $FF288C37);