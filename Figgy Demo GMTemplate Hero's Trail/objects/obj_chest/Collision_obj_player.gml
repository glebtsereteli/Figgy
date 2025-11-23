if(locked == true)
{
	var l350E5CD4_0;
	l350E5CD4_0 = keyboard_check_pressed(ord("E"));
	if (l350E5CD4_0)
	{
		audio_play_sound(snd_chest_locked, 0, 0);
	}

	exit;
}

var l61029B84_0;
l61029B84_0 = keyboard_check_pressed(ord("E"));
if (l61029B84_0)
{
	audio_play_sound(snd_chest_open, 0, 0);

	effect_create_above(7, x + 0, y + -20, 1, $FF00FFFA & $ffffff);

	obj_player.coins += coins_to_give;

	instance_change(obj_chest_open, true);
}