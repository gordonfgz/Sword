
function SkeletonWander(){
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
		
		//Collide & move
		var _collided = EnemyTileCollision();
		
	
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

function SkeletonChase(){
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
			show_debug_message("Skeleton Attacks Player");
			state = ENEMYSTATE.ATTACK;
			sprite_index = sprAttack;
			image_index = 0;
			image_speed = 1.0;
			xTo += lengthdir_x(60, dir);
			yTo += lengthdir_y(60, dir);
		}
	}
}
	
function SkeletonAttack(){
	var _spd = 10;
	
	//Dont move while still getting ready
	if (image_index < 2) {
		_spd = 0;
	}
	
	//Freeze animation while in mid dash and also after landing finishes
	if (floor(image_index) == 3 || floor(image_index) == 5) {
		image_speed = 0;
	}
	
	//How far we have to jump
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	//begin landing end of the animation once we are nearly done
    if (_distanceToGo < 4 && image_index < 5) {
		image_speed = 1;
	}
	
	//Move
	if (_distanceToGo > _spd) {
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		if (hSpeed !=0) {
			image_xscale = sign(hSpeed);
		}
		
		//Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true) {
			show_debug_message("COLLIDED WITH SOMETHING");
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if (floor(image_index ==5)) {
			show_debug_message("Ended animation, switching back to chase mode");
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
	
}

function SkeletonHurt() {
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

function SkeletonDie() {



}