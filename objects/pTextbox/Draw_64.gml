/// @description Insert description here
// You can write your code in this editor
NineSliceBoxStretched(sTextbox, x1, y1, x2, y2, background);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message_array[message_index], 1, textProgress);
draw_text((x1+x2)/2, y1+8, _print);
draw_set_color(c_white);
draw_text((x1+x2)/2, y1+7, _print)

draw_set_color(c_ltgrey);
draw_text((x1+x2)/2, y2-50, "<Press spacebar to continue>");