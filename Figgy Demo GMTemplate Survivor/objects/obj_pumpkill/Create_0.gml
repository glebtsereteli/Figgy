// @Figgy: Store the PumpKill config struct to use throughout the object.
cfg = CFG.Enemies.Pumpkill;

// Call parent event to set up general eney stuff.
event_inherited();

// Set speed for this enemy type.
//speed = 6; // @Figgy: Replaced with a config in obj_enemy's Step event.

// Set max hitpoints for this enemy type.
//hitpoints_max = global.enemy_health_bonus; // @Figgy: Using config in obj_enemy's Create event.

// Set hitpoints.
//hitpoints = hitpoints_max; // @Figgy: Using config in obj_enemy's Create event.

// Set sprites for this enemy type.
walk_sprite = spr_pumpkill_walk;
attack_sprite = spr_pumpkill_attack;
hit_sprite = spr_pumpkill_hit;