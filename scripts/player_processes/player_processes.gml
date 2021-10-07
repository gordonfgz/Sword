function reset_variables() {
	left = 0;
	right = 0;
	down = 0;
	up = 0;
}





function get_input() {
	if keyboard_check(ord("A")) {
		left = 1;
	}
	if keyboard_check(ord("W")) {
		up = 1;
	}
	if keyboard_check(ord("S")) {
		down = 1;
	}
	if keyboard_check(ord("D")) {
		right = 1;
	}
}

function calc_movement() {
	var hmove = right - left;
	var vmove = down - up;
	
	if hmove != 0 or vmove != 0 {
		//get direction
		var dir = point_direction(0,0, hmove, vmove);
		
		//get distance we are moving
		hmove = lengthdir_x(WalkSpeed, dir);
		vmove = lengthdir_y(WalkSpeed, dir);
		
		//add movement to player position
		x += hmove;
		y += vmove;
		
	}
	
	
}

function collision(){
	var tx = x;
	var ty = y;
	
	//move backt o last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get distance we want to move
	var disx = abs(tx - x);
	var disy = abs(ty - y);
	
	//move as far as in x and y before hitting the solid
	repeat(disx){
		if !place_meeting(x + sign(tx-x), y, O_solid) {
			x += sign(tx-x);
		}
	}
	repeat(disy){
		if !place_meeting(x, y + sign(ty-y), O_solid) {
			y += sign(ty-y);
		}
	}
	
}