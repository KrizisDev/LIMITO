/// @desc Initialize variables

randomize();

audio_group_load(audiogroup_mus);
audio_group_load(audiogroup_sfx);

// Global variables
global.window_scale = 3;
global.is_fullscreen = false;
global.music_vol = 10;
global.sfx_vol = 10;
global.inputs_left = 20;
global.inputs_used = 0;
global.game_started = false;
global.game_completed = false;
global.deaths = 0;
global.timer = false;
global.timer_seconds = 0;
global.timer_minutes = 0;
global.stage = 1;
global.stage_color = irandom_range(0, 5);
global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);

// Global arrays
global.menu[0] = "Start Game";
global.menu[1] = "Options";
global.menu[2] = "Credits";
global.menu[3] = "Quit";
global.menu_options[0] = "Music volume: " + string(global.music_vol);
global.menu_options[1] = "SFX volume: " + string(global.sfx_vol);
global.menu_options[2] = "Window scale: " + string(global.window_scale);
global.menu_options[3] = "Fullscreen: ";
global.menu_options[4] = "Back";

// Game window
window_set_size(320 * global.window_scale, 180 * global.window_scale);
display_set_gui_size(320, 180);
surface_resize(application_surface, 320 * global.window_scale, 180 * global.window_scale);

alarm[0] = 1;