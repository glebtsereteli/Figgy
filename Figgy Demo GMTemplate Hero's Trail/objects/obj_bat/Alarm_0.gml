// Create projectile
var _projectile = instance_create_layer(x, y, "Instances", obj_bat_projectile);
_projectile.speed = cfg.ProjectileSpeed;

// Set alarm to run again after 90 steps
alarm[0] = cfg.ShootDelay;

// Play shooting sound
audio_play_sound(snd_bat_shoot, 0, 0);