// This object can be placed anywhere in the room and a sound asset can be assigned to its
// "sound_to_loop" variable (see the Variable Definitions window)

// Create an audio emitter for the sound
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, 200, 600, 1);

// Set emitter position
audio_emitter_position(audio_emitter, x, y, 0);

// This statement plays the assigned sound using the emitter
audio_play_sound_on(audio_emitter, sound_to_loop, true, 1);