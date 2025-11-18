
cfg = CFG.Character.Defeat; // @Figgy: Store config struct in a variable to reference throughout the object.

// Enable gravity
gravity = cfg.Gravity;

// Make the instance jump up
vspeed = -cfg.Jump;

// Flip the sprite horizontally so it faces right (as the original sprite for this object faces left)
image_xscale = -1;

// Set Alarm 0 to run after a while, which starts the transition
alarm[0] = 30;

// Stop all playing audio
audio_stop_all();

// Play the lose sound effect
audio_play_sound(snd_music_lose, 0, 0);