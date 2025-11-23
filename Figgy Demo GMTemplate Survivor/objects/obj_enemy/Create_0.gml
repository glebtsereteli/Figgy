// Create variable for max hitpoints.
hitpoints_max = cfg.Health * global.enemy_health_bonus; // @Figgy: Use config.

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
//speed = 4; // @Figgy: Replaced with a config in the Step event.

// Create variable to show/hide the healthbar.
show_healthbar = 0;

// Create shadow object to follow.
var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;