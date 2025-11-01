
zoom = lerp(zoom, cfg.Zoom, 0.1);
camera_set_view_size(CAM, BASE_W / zoom, BASE_H / zoom);

Follow();
