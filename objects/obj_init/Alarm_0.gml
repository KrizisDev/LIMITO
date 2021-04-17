/// @desc Start game

window_center(); // Center game window to fix position issues
audio_sound_gain(mus_ambience, 0, 0);
audio_sound_gain(mus_game, 0, 0);
room_goto_next();