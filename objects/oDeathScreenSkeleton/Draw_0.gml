/// @description Insert description here
// You can write your code in this editor
var i = 0;
repeat(array_length(buttons)) {
	// draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	xx = menu_x;
	yy = menu_y + (button_h + button_padding) * i + 256*(1-unfold[i]);
	
	draw_set_color(c_dkgray);
	draw_rectangle(xx - button_w/2, yy, xx+button_w/2, yy+button_h, false);
	draw_set_color(c_ltgray);
	
	if (menu_index == i) draw_set_color(c_aqua);
	
	draw_text(xx, yy+button_h/2, buttons[i]);
	i++;
}