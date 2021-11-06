
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
			xTo += lengthdir_x(100, dir);
			yTo += lengthdir_y(100, dir);
		}
	}
}
	
function SkeletonAttack(){
	var _spd = 5;
	
	//Dont move while still getting ready
	if (image_index < 3) {
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
		if (floor(image_index == 5)) {
			show_debug_message("Ended animation, switching back to chase mode");
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 40;
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
		
		with(instance_exists(oRoomExit)) {
			canTransit = true;
		}
		with(instance_exists(oPlayer)) {
			oPlayer.stage2 = true;
			oPlayer.spriteRun = sPlayerRunStage2;
			oPlayer.spriteIdle = sPlayer2;
			global.playerHealth = global.playerHealthMax;
		}
		instance_destroy();
		instance_create_layer(x, y, "Instances", oTextboxEnd);
	}

}

// MAYBE IN THE FUTURE I WILL USE THIS???
function SkeletonHBAttack(){
	//Use attack hitbox and check for hits
	ds_list_clear(hitByAttack);
	//show_debug_message("TRYING TO DETECT HTIS");
	mask_index = sShadowBlastHB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,oPlayer,hitByAttackNow,false);
	if (hits > 0)
	{
		//show_debug_message("SOMETHING IS HIT");
		for (var i = 0; i <hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{	
					HurtPlayer(0,0,1);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
}