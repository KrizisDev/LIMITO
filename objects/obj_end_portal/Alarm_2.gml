/// @desc

audio_stop_sound(mus_game);
global.game_completed = true;
alarm[1] = 420;
screen_alpha = 4;
obj_camera.can_remove_shake = true;
obj_camera.shake = 8;
instance_deactivate_object(obj_sawblade);
instance_deactivate_object(obj_spikes);
instance_deactivate_object(obj_crusher);
instance_deactivate_object(obj_player);