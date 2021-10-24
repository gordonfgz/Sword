
function WizardChase(){
	show_debug_message("wizard is chasing");
	sprite_index = sprMove;
	//At destination
	if ((y == yTo && x == xTo)) {
		show_debug_message("REACHED DESTINATION!!");
		xTo = 740;

		
		//Set new target destination
		var _wanderDir = irandom_range(0,1);
		if (_wanderDir == 0) { //move up
			var _wanderDistance = irandom_range(100,300);
		} else { //move down
			var _wanderDistance = irandom_range(-100,-300);
		}
		yTo = y + _wanderDistance
		// limits of the platform
		if (yTo <= 400) {
			yTo = 400;
		}
		if (yTo >= 752) {
			yTo = 752;
		}
		
		
		
	} else {
		show_debug_message("HAVENT REACH DESTINATION!!");
		show_debug_message(x);
		show_debug_message(xTo);
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) {
			_speedThisFrame = _distanceToGo;
		}
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);
		}
		
		//Collide & move
		var _collided = EnemyTileCollision();
		
	
	}
	
	//Check if can attack
	if (canAttack && instance_exists(oPlayer) && point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAttackRadius) {
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
	}
}
	
function WizardAttack(){
	show_debug_message("Wizard is attacking")
	if (instance_exists(oPlayer)) {
		if (floor(image_index >= 4)) {
			if (canAttack) {
				ShadowBlast();
			}
			if (floor(image_index >=7)) {
				state = ENEMYSTATE.CHASE;
				canAttack = false;
				timer = timerResetValue;
			}
		}	
	}
}
	

function WizardHurt() {
	show_debug_message("WIZARD IS HURT");
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed) {
		show_debug_message("IF BLOCK");
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(KNOCKBACKSPEED, dir);
		vSpeed = lengthdir_y(KNOCKBACKSPEED, dir);
		
		//Collide and move if there is a collision, then stop knockback
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		show_debug_message("ELSE BLOCK");
		state = ENEMYSTATE.CHASE;
		xTo = x;
		yTo = y;
		x = xTo;
		y = yTo;
		
		
	
	}
}

function WizardDie() {
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed) {
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0 ) {
			image_xscale = -sign(hSpeed);
		}
		
		//Collide and mvoe
		EnemyTileCollision();
	} else {
		x = xTo;
		y = yTo;
	}
	
	// check animation is finished
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number) {
		instance_destroy();
		with(instance_exists(oRoomExit)) {
			canTransit = true;
		}
	}

}
	
function ShadowBlast() {
	if (instance_exists(oPlayer)) {
		canAttack = false;
		timer = timerResetValue;
		target = oPlayer;
		instance_create_depth(floor(target.x), floor(target.y), depth, oShadowBlast)	
		
	}
}


