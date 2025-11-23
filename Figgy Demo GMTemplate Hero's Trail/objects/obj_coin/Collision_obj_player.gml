// Destroy on collision with player
instance_destroy();

// Create effect
effect_create_above(ef_flare, x, y, 1, $FF00D8FF);

// Play coin sound
audio_play_sound(snd_coin, 0, 0);