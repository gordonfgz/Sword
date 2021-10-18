event_inherited();

state = ENEMYSTATE.WANDER;

// Attack Speed Regulation
AttackCooldown = 0;
AttackTimer = 1;

//Aura regulation
PassiveCooldown = 0;
PassiveTimer = 500;

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
