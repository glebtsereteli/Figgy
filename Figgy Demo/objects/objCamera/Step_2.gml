
zoom = lerp(zoom, cfg.Zoom, 0.1);
camera_set_view_size(CAM, width / zoom, height / zoom);

Follow();
