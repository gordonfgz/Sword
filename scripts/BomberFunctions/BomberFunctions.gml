
function BomberWander(){
	sprite_index = sprMove;
	//At destination or given up?
	if ((x == xTo) && (y == yTo) || (timePassed > enemyWanderDistance / enemySpeed)) {
		hSpeed = 0;
		vSpeed = 0;
		//End our move animation
		if (image_index < 1) {
			image_speed = 0.0;
			image_index = 0;
		}
		//Set new target destination
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y, xstart, ystart) + irandom_range(-45,5);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
		
		
	} else {
		timePassed++;
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
		
		
	
	}
	
	//Check for aggro
	if (++aggroCheck > aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(oPlayer) && point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius) {
			show_debug_message("Skeleton chasing Player")
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}

}

function BomberChase(){
	sprite_index = sprMove;
	if (instance_exists(target)) {
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed) {  // if distance left to move is more than enemy unit speed
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		} else {
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0) { // face the direction its moving towards
			image_xscale = sign(hSpeed);
		}
		//Collide & Move
		EnemyTileCollision();
		
		//Check if can attack
		if (point_distance(x,y,target.x,target.y) <= enemyAttackRadius) {
			state = ENEMYSTATE.DIE;
			sprite_index = sprDie;
			image_index = 0;
			image_speed = 1.0;
		}
	}
}
	

function BomberHurt() {
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed) {
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(KNOCKBACKSPEED, dir);
		vSpeed = lengthdir_y(KNOCKBACKSPEED, dir);
		if (hSpeed != 0) {
			image_xscale = -sign(hSpeed);
		}
		
		//Collide and move if there is a collision, then stop knockback
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) {
			state = statePrevious;
		} else {
			state = ENEMYSTATE.CHASE;
		}
	
	}
}

function BomberDie() {
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
		instance_create_depth(floor(x), floor(y), depth, oFire)
	}

}