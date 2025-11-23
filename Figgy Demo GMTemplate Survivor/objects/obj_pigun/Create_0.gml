// @Figgy: Store the Pigun config struct to use throughout the object.
cfg = CFG.Enemies.Pigun;

// Call parent event to set up general enemy stuff.
event_inherited();

// Set max hitpoints specifically for this enemy type.
//hitpoints_max = 3 * global.enemy_health_bonus; // @Figgy: Using config in obj_enemy's Create event.

// Set hitpoints specifically for this enemy type.
//hitpoints = hitpoints_max; // @Figgy: Using config in obj_enemy's Create event.

// Set sprites for this enemy type.
walk_sprite = spr_pigun_walk;
attack_sprite = spr_pigun_attack;
hit_sprite = spr_pigun_hit;