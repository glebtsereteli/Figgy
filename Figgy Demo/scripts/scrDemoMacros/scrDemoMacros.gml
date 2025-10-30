
#macro EVENT_METHOD event_user(14)
#macro EVENT_FSM event_user(15)

#macro CAM view_camera[0]
#macro CAM_W camera_get_view_width(CAM)
#macro CAM_H camera_get_view_height(CAM)
#macro CAM_HALFW (CAM_W / 2)
#macro CAM_HALFH (CAM_H / 2)
#macro CAM_X1 camera_get_view_x(CAM)
#macro CAM_Y1 camera_get_view_y(CAM)
#macro CAM_X2 (CAM_X1 + CAM_W)
#macro CAM_Y2 (CAM_Y1 + CAM_H)
#macro CAM_XCENTER (CAM_X1 + CAM_HALFW)
#macro CAM_YCENTER (CAM_Y1 + CAM_HALFH)
#macro CAM_ANG camera_get_view_angle(CAM)
