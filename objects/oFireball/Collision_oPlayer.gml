if(state == ENEMYSTATE.ATTACK && oPlayer.invulnerable <= 0) {
	HurtPlayer(point_direction(x,y,oPlayer.x,oPlayer.y), enemyForceTouch, enemyDamageTouch);
	
}
