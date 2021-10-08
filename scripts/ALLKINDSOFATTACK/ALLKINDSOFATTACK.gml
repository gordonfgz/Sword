function AttackSlash() {
	
	//Attack just started
	if (sprite_index != sPlayerAttackSlash) {
		//Set up correct animation
		sprite_index = sPlayerAttackSlash;
		localframe = 0;
		image_index = 0;
		
		//Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
	}
	
	CalcAttack(sPlayerAttackSlashHitBox);
	
	//Update Sprite
	PlayerAnimateSprite();
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
}