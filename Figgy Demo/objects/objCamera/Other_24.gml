/// @desc Methods

Follow = function(_snap = false) {
	static _GetTarget = function(_delta, _threshold) {
		return ((abs(_delta) > _threshold) * ((abs(_delta) - _threshold) * sign(_delta)));
	};
	
	if (instance_exists(target)) {
		xTo = x + _GetTarget(target.x - x, cfg.DeadzoneX);
		yTo = y + _GetTarget(mean(target.bbox_top, target.bbox_bottom) - y, cfg.DeadzoneY);
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
