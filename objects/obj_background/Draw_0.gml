/// @desc

gpu_set_blendmode(bm_add);
draw_sprite_tiled_ext(global.stage_background, global.stage_color, x + (camera_get_view_x(obj_camera.cam) * 0.6), y + (camera_get_view_y(obj_camera.cam) * 0.6), 1, 1, image_blend, bg_alpha);
draw_sprite_tiled_ext(global.stage_background, global.stage_color, (-x / 2) + (camera_get_view_x(obj_camera.cam) * 0.6), (-y / 2) + (camera_get_view_y(obj_camera.cam) * 0.6), 1, 1, image_blend, bg_alpha);
gpu_set_blendmode(bm_normal);

if(room != rm_menu)
{
	bg_alpha = wave(0.05, 0.08, 3, 0);
}
x = wave(0, 16, 12, 0);
y += 0.2;
if(y == 180)
{
	y = 0;
}