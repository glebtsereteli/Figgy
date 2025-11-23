/// This event runs when a power up is over
// Disable power up variables
powerup_active = false;
star_powerup_active = false;

// Reset move speed
move_speed = cfg.MoveSpeed; // @Figgy: Use config.

// Reset color and animation speed
image_blend = c_white;
image_speed = 1;

// If the rampage music is playing, stop it
if (audio_is_playing(snd_music_rampage))
{
	audio_stop_sound(snd_music_rampage);
}

// If the game music is paused, resume it
if (audio_is_paused(snd_music_game))
{
	audio_resume_sound(snd_music_game);
}