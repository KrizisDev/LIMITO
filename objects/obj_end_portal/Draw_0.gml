/// @desc

gpu_set_fog(1, choose(c_red, c_orange, c_yellow, c_green, c_blue, c_purple, c_fuchsia), 0, 0)
draw_sprite_ext(sprite_index, image_index, x + random_range(-2, 2), y + random_range(-2, 2), 1, 1, image_angle, image_blend, image_alpha);
gpu_set_fog(0, 0, 0, 0);

gpu_set_blendmode(bm_add);
draw_self();
gpu_set_blendmode(bm_normal);