// Destroy bat on touching sword
instance_destroy();

// Create particle effect
effect_create_above(ef_smokeup, x, y, 1, $FF482F8C);

// Play bat defeat sound
audio_play_sound(snd_bat_defeat, 0, 0);