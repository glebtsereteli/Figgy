// @Figgy: Store the Rooster config struct to use throughout the object.
cfg = CFG.Enemies.Rooster;

// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
speed = 2;

// Set sprites for this enemy type.
walk_sprite = spr_rooster_walk;
attack_sprite = spr_rooster_attack;
hit_sprite = spr_rooster_hit;