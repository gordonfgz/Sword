/// @description Insert description here
// You can write your code in this editor
switch(menu_index) {
	case 0: {
		// retry
		room_goto(rDungeon);
		break;
	}
	// Main Menu
	case 1: {
		room_goto(rMenu);
		break;
	}
	// Quit
	case 2: {
		game_end();
		break;
	}	
}