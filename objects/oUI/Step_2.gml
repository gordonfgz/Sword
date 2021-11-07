/// @description Insert description here
// You can write your code in this editor
if (global.pauseMenu) {
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
				global.pauseMenu = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
			} break;
			case 1: { // Restart Game
				global.gamePaused = false;
				global.pauseMenu = false;
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
				room_restart();
			} break;
			case 2: { // Main Menu
				global.gamePaused = false;
				global.pauseMenu = false;
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
				game_restart();
			} break;
			case 3: { // Quit Game
				global.pauseMenu = false;
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
				game_end();
			} break;	
		}
	}
}