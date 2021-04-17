if(global.game_started == false)
{
	global.game_started = true;
	global.timer = true;
	play_sound(sfx_player_bigland, 0.02);
	audio_play_sound(mus_game, 1, true);
	audio_sound_gain(mus_game, global.music_vol / 10, 3000);
	obj_camera.shake = 1;
	obj_camera.camera_flash = 1;
}