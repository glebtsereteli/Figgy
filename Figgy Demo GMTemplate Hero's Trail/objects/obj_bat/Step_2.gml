// Flip sprite based on X movement
var x_movement = x - xprevious;

if (x_movement < 0)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

// Move audio emitter
audio_emitter_position(audio_emitter, x, y, 0);