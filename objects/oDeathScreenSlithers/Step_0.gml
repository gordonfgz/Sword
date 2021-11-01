/// @description Insert description here
// You can write your code in this editor

menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

menu_index += menu_move;
if (menu_index < 0) menu_index = array_length(buttons) - 1;
if (menu_index >= array_length(buttons)) menu_index = 0;

var i = 0;
repeat(array_length(buttons)) {
	if (unfold[i] == 1) i++;
	
	if (i < array_length(buttons)) unfold[i] = min(1, unfold[i]+0.02);
	if (i+1 < array_length(buttons)) unfold[i+1] = min(1, unfold[i+1]+0.005);
	
}

if (menu_index != last_selected) {
	part_particles_create(particle_effects, menu_x, menu_y+button_h/2 + (button_h+button_padding)*menu_index, box_flash, 1);
}

last_selected = menu_index;