EVENT_METHOD;

cfg = CFG.Camera;

width = 640;
height = 360;
target = objPlayer;
xTo = 0;
yTo = 0;
zoom = cfg.Zoom;

var _windowScale = 2;
window_set_size(width * _windowScale, height * _windowScale);

var _appsurfScale = 4;
surface_resize(application_surface, width * _appsurfScale, height * _appsurfScale);

window_center();
