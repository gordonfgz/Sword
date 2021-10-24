// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
	//MOvement
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = sPlayerHurt;
	if (CARDINAL_DIR <= 0 or CARDINAL_DIR > 3) {
		image_index = 0;
	} else {
		image_index = CARDINAL_DIR;
	}
	
	
	//Change height
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	//Change State
	if (moveDistanceRemaining <= 0 ) {
		state = PlayerStateFree;
	}
}