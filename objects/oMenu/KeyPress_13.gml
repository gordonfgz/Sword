/// @description Insert description here
// You can write your code in this editor
switch(menu_index) {
	case 0: {
		// start game
		room_goto(rStart);
		break;
	}
	case 1: {
		room_goto(rInstructions);
		break;
	}
}