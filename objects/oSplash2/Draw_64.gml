

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(640,930,print)
draw_set_font(fCutscene)


if (next >= 0)
{
	draw_set_alpha(Wave(0.2,0.8,1,0));
	draw_text(640,670,"Press Enter to continue");
	draw_set_alpha(1);
}






draw_sprite_ext(sPixel, 0, 0, 0, 1366, 768, 0, c_black, a);