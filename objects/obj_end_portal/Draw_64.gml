/// @desc

if(fade_out <= 300)
{
	screen_alpha += 0.008;
	draw_set_color(c_black);
}
else
{
	draw_set_color(c_white);
}
draw_set_alpha(screen_alpha);
draw_rectangle(0, 0, 320, 180, false);
draw_set_alpha(1);

if(room == rm_stage20)
{
	if(fade_out < 350)
	{
		supertext(115, 84, "GAME #(P30)#(S0.1)COMPLETE", 0, 999, c_white, fnt_sullyverge, 0.2, sfx_typewriter, 1, 0.02);
	}
}