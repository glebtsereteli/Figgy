cfg = CFG.Enemies.Rooster; // @Figgy: Store the Rooster config struct to use throughout the object.

// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
//speed = 2; // @Figgy: Replaced with a config in obj_enemy's Step event.

// Set sprites for this enemy type.
walk_sprite = spr_rooster_walk;
attack_sprite = spr_rooster_attack;
hit_sprite = spr_rooster_hit;