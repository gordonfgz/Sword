event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlithers_idle;
sprAttack = sSlithersAttack;
sprDie = sSlithersDeath;
sprHurt = sSlithersHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlithersWander;
enemyScript[ENEMYSTATE.CHASE] = SlithersChase;
enemyScript[ENEMYSTATE.ATTACK] = SlithersAttack;
enemyScript[ENEMYSTATE.HURT] = SlithersHurt;
enemyScript[ENEMYSTATE.DIE] = SlithersDie;
