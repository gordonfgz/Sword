/// @description Insert description here
// You can write your code in this editor
if (global.gamePaused) {
	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) - 1;
	
	keyActivate = keyboard_check_pressed(vk_enter);
	
	if (keyActivate) {
		switch(pauseOptionSelected) {
			case 0:{ // Resume
				global.gamePaused = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
			} break;
			case 1: { // Restart Game
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
				game_restart();
			}
		}
	}
}