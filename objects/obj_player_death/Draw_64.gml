/// @desc

draw_set_alpha(screen_alpha);
gpu_set_blendmode(bm_add);
draw_rectangle(0, 0, 320, 180, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);