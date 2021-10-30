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
	
	case 2: {
		room_goto(rCreds);
		break;
	}
	
	case 3: {
		game_end();
		break;
	}	
}