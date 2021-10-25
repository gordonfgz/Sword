/// @description Insert description here
// You can write your code in this editor

menu_x = room_width/2;
menu_y = room_height/2;
button_h = 24;
button_w = 256;
button_padding = 8;

// buttons
buttons = ["Start Game", "Instructions"];

menu_index = 0;
last_selected = 0;

var i = 0;
repeat(array_length(buttons)) {
	unfold[i] = 0;
	i++;
}

particle_effects = part_system_create();
part_system_depth(particle_effects, -1000);

box_flash = part_type_create();
part_type_shape(box_flash, pt_shape_line);
part_type_size(box_flash, 5, 5, -0.02, 0);
part_type_color3(box_flash, make_color_rgb(128, 255, 0), make_color_rgb(0, 128, 255), make_color_rgb(128, 255, 0));
part_type_alpha3(box_flash, 0.03, 0.5, 0);
part_type_blend(box_flash, true);
part_type_life(box_flash, 20, 20);