// Destroy the light particle type
part_type_destroy(light);

// Destroy the light emitter
part_emitter_destroy(part_sys, light_emitter);

// Destroy this instance's particle system
part_system_destroy(part_sys);