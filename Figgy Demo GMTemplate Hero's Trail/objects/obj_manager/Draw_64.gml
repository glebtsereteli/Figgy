// If the player exists
if (instance_exists(obj_player))
{
	// Draw the HUD coin sprite
	draw_sprite(spr_hud_coin, 0, 1100, 25);

	// Change the font to ft_hud
	draw_set_font(fnt_hud);

	// Draw the player's coins value
	// Taken from the player using obj_player.coins
	draw_text(1135, 15, "x" + string(obj_player.coins));

	var heart_width = sprite_get_width(spr_hud_heart);
	for (var i = 0; i < obj_player.hearts; i ++) {
		draw_sprite(spr_hud_heart, 0, 30 + i * heart_width, 30);
	}

	// Draw a left-aligned "healthbar"
	// The value is the player's 'shield_energy'
	// When that value is 100, the meter is full
	// We're also passing in coordinates for the
	// meter's left, top, right and bottom edges
	// The alpha for the outline colour is 0 so
	// there is no visible outline
	draw_healthbar(65, 100, 260, 125, obj_player.shield_energy, $FF2D1810 & $FFFFFF, $FF4F364B & $FFFFFF, $FFA34C2F & $FFFFFF, 0, (($FF2D1810>>24) != 0), (($008E8E8E>>24) != 0));

	// Draw a shield icon where the meter starts
	// This statement is placed after the "healthbar"
	// statement so the shield icon draws above the
	// meter
	draw_sprite(spr_hud_shield, 0, 35, 90);
}