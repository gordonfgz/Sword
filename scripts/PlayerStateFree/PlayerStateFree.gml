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
		if (stage2) {
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll
		}
	}
	
	//Change to attack state
	if (keyAttack) {
		if (!stage2 && !stage3) {
			state = PlayerStateAttack;
			stateAttack = AttackSlash;
		}
		if (stage2 && !stage3) {
			state = PlayerStateAttack;
			stateAttack = AttackSlash2;
		}
		if (stage2 && stage3) {
			state = PlayerStateAttack;
			stateAttack = AttackSlash3;
		}
	}
	
	//Change to shoot state
	if (keyShoot && stage3) {
		state = PlayerStateAttack;
		stateAttack = AttackShoot;
	}
	
	
	//Interact with entities
	if (keyActivate) {
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);
		
		// if the first isntance we find is either our lifted entity or it has no script, try the next one
		while (_entitiesFound > 0) {
			var _check = _activateList[| --_entitiesFound];
			if ((_check != global.iLifted) && (_check.entityActivateScript != -1)) {
				activate = _check;
				break;
			}
		
		}
		
		
		ds_list_destroy(_activateList);
		
		
		if (activate = noone) {
			//Throw something if held, otherwise set back to free
			if (global.iLifted != noone) {
				PlayerThrow();
			} else {
				state = PlayerStateFree;
			}
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

