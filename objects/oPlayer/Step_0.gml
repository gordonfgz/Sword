//Get Player Input
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyAttack = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(ord("J"));
keyActivate = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(ord("K"));
keyRoll = keyboard_check_pressed(vk_space);

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputDirectionX = point_direction(0,0,keyRight-keyLeft,0);
inputDirectionY = point_direction(0,0,0,keyDown-keyUp);
inputMagnitude = (keyRight-keyLeft != 0) or (keyDown - keyUp != 0);

if (!global.gamePaused) {
	script_execute(state);
	invulnerable = max(invulnerable - 1.0);
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom;