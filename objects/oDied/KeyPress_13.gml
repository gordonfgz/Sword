/// @description Insert description here
// You can write your code in this editor
switch(menu_index) {
	case 0: {
		// start game
		room_goto(rMenu);
		break;
	}
	case 1: {
		if instance_exists(oSkeleton) then room_goto(rDungeon);
		if instance_exists(oSlithers) then room_goto(rDungeon1);
		if instance_exists(oWizard) then room_goto(rDungeon2);
		break;
	}
	
}