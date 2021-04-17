/// @desc

cam = view_camera[0];
follow = obj_player;
xTo = xstart;
yTo = ystart;
view_width = camera_get_view_width(cam) * 0.5;
view_height = camera_get_view_height(cam) * 0.5;
shake = 0;
can_remove_shake = true;

camera_flash = 0;