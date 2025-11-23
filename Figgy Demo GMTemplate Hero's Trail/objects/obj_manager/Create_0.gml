// Stop the menu music
audio_stop_sound(snd_music_menu);

// Stop the game music
audio_stop_sound(snd_music_game);

// Start game music
audio_play_sound(snd_music_game, 0, 1);

// Pause variable (true if game is paused, otherwise false)
pause = false;