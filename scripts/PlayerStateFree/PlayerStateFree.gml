function PlayerStateFree() {
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;


	if (_oldSprite != sprite_index) localFrame = 0;

	//Update Image Index
	PlayerAnimateSprite();

	//Change to roll state
	if (keyRoll) {
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll
	}
	
	//Change to attack state
	if (keyAttack) {
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	
	//Interact with entities
	if (keyActivate) {
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x + _activateX, y + _activateY, pEntity);
		if (activate = noone || activate.entityActivateScript == -1 ) {
			state = PlayerStateFree;
		} else {
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			if (activate.entityNPC) {
				with (activate) {
					direction = point_direction(x,y,other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
}

