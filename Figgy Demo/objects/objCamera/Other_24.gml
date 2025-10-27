/// @desc Methods

Follow = function(_snap = false) {
	if (instance_exists(target)) {
		xTo = target.x;
		yTo = mean(target.bbox_top, target.bbox_bottom);
	}
	
	x = lerp(x, xTo, max(cfg.LerpStepX, _snap));
	y = lerp(y, yTo, max(cfg.LerpStepY, _snap));
	
	if (cfg.Clamp) {
		x = clamp(x, CAM_HALFW, room_width - CAM_HALFW);
		y = clamp(y, CAM_HALFH, room_height - CAM_HALFH);
	}
	
	camera_set_view_pos(CAM, x - CAM_HALFW, y - CAM_HALFH);
};
Snap = function() {
	Follow(true);
};
