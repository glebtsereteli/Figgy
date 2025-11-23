// Unlocked the chest that is linked to this key
chest_to_open.locked = false;

// Destroy the key and create a particle effect
instance_destroy();
effect_create_above(ef_ring, x, y, 0, c_white);

// Play the key collection sound effect
audio_play_sound(snd_key, 0, 0);