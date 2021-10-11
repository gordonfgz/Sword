event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSkeletonRun1D;
sprAttack = sSkeletonAttack;
sprDie = sSkeletonDie;
sprHurt = sSkeletonHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SkeletonWander;
enemyScript[ENEMYSTATE.CHASE] = SkeletonChase;
enemyScript[ENEMYSTATE.ATTACK] = SkeletonAttack;
enemyScript[ENEMYSTATE.HURT] = SkeletonHurt;
enemyScript[ENEMYSTATE.DIE] = SkeletonDie;
