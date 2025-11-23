if (is_mouse_over_debug_overlay()) exit; // @Figgy: Debug overlay blocks mouse.

// Play the button sound
audio_play_sound(snd_button, 0, 0);

// Set the frame to 2 (pressed)
image_index = 2;