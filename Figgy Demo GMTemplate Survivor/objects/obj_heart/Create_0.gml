// @Figgy: Store the Heart config struct to use throughout the object.
cfg = CFG.Pickups.Heart;

// Create shadow object to follow.
var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;
// Set shadows image scale.
_shadow.image_xscale = 0.5;
_shadow.image_yscale = 0.5;

float_timer = 0;