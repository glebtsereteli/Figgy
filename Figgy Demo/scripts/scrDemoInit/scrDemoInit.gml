
function DemoInit() {
	window_set_caption($"{__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) Demo!");
	randomize();
	application_surface_draw_enable(false);
	display_set_gui_size(display_get_width(), display_get_height());
	
	draw_set_font(fntDemo);
	font_enable_effects(fntDemo, true, {
		outlineEnable: true,
		outlineColor: #353541,
		outlineDistance: 2,
	});
	
	instance_create_depth(0, 0, -15000, objDemoControl);
	
	room_goto(rmDemo);
}
