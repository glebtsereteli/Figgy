cfg = CFG.Enemies.Bat; // @Figgy: Store the Bat config struct to use throughout the object.

// Create an audio emitter for the flying sound
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, 200, 600, 1);

// Play flying sound using the emitter
audio_play_sound_on(audio_emitter, snd_bat_fly, 0, 1);

// Set emitter position
audio_emitter_position(audio_emitter, x, y, 0);