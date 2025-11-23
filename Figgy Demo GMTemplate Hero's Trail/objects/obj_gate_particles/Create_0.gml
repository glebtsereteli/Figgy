// Create a new particle system for this instance's effects
part_sys = part_system_create_layer("Instances", false);

// Create a particle type for the gate's light
light = part_type_create();
part_type_blend(light, true);

// Set the life of the light particle
part_type_life(light, 80, 160);

// Set the sprite of the light particle
part_type_sprite(light, spr_entrance_particle, true, false, false);

// Set the size of the light particle
part_type_size(light, 0.3, 0.48, -0.002, 0);

// Set the alpha of the light particle
part_type_alpha3(light, 0.1, 1, 0);

// Set the speed of the light particle
part_type_speed(light, 0.2, 0.8, 0, 0);

// Set the movement direction of the light particle, which is based on the 'light_direction' variable
// defined in the Variable Definitions of this object
// The 'light_direction_increase' variable from the Variable Definitions is also used
part_type_direction(light, light_direction - 30, light_direction + 30, light_direction_increase, 0.5);

// Create an emitter to continually emit particles in our system
light_emitter = part_emitter_create(part_sys);

// Set the region where this emitter will create particles
// The region is based on the bounding box of this instance (its actual dimensions in the room, after scaling)
part_emitter_region(part_sys, light_emitter, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);

// Tell the emitter to continually "stream" the light particle type
// The count is taken from the 'light_count' variable defined in the Variable Definitions
part_emitter_stream(part_sys, light_emitter, light, light_count);