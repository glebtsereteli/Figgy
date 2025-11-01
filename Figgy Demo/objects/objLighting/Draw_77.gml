
if (cfg.Enabled) {
	renderer.Update();
	BulbDrawLitSurface(renderer, application_surface, 0, 0, window_get_width(), window_get_height(), true);
}
else {
	draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
}
