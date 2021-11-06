/// @description Pause the Game

if (keyboard_check_pressed(vk_escape) && (!instance_exists(oTransition)) && (!global.textboxActivated)) {
	global.pauseMenu = !global.pauseMenu;
	global.gamePaused =!global.gamePaused;
	
	if (global.gamePaused) {
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	} else {
		with (all) {
			image_speed = gamePausedImageSpeed;
		}
	}
}

if (!instance_exists(oTransition) && global.textboxActivated) {
	if (global.gamePaused) {
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	} else {
		with (all) {
			image_speed = gamePausedImageSpeed;
			global.textboxActivated = false;
		}
	}
}

