/// @desc

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_sullyverge);
draw_set_color(c_white);
draw_text(room_width / 2, 20, "GAME COMPLETE");
draw_text(room_width / 2, (room_height / 2) - 32, "RESULTS:");
draw_text(room_width / 2, (room_height / 2) - 16, timer_str);
draw_text(room_width / 2, room_height / 2, inputs_str);
draw_text(room_width / 2, (room_height / 2) + 16, deaths_str);

if(frame >= 120)
{
	draw_text(room_width / 2, 160, "Press any key to return to the menu.");
}