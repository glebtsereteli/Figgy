// Stop all audio.
audio_stop_all();

// Play the lose game jingle.
audio_play_sound(snd_lose, 0, false);

// Create exit button.
instance_create_layer(x - 180, 1080 - 330, "Buttons", obj_button_exit);

// Create retry button.
instance_create_layer(x + 180, 1080 - 330, "Buttons", obj_button_retry);