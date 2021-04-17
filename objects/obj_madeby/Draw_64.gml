/// @desc

if(frame >= 30)
{
	alpha += 0.1;
	draw_set_alpha(alpha);
	draw_set_font(fnt_sullyverge);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2, "Made by Krizis\nfor the #GM20 game jam");
	draw_set_alpha(1);
}