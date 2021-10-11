
function RoomTransition(_type, _targetroom){
	if (!instance_exists(oTransition)) {
		with(instance_create_depth(0,0,-9999,oTransition)) {
			type = _type;
			target = _targetroom;
		}
	} else {
		show_debug_message("Error: Trying to transition while transitioning is happening!")
	}
}