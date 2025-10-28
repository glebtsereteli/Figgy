
//draw_text(600, 300, CFG.Player.Stats.Health);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width() / 2, display_get_gui_height() - 8, "Press [F] to open the config file.");
draw_set_halign(fa_left);
draw_set_halign(fa_top);

var _path = $"{game_save_id}save.json";