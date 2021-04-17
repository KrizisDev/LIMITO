/// @desc

global.deaths ++;
instance_create_depth(x, y, -1000, obj_player_death);
play_sound(sfx_player_death, 0.02);