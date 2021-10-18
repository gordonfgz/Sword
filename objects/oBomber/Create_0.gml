event_inherited();
collisionMap = layer_tilemap_get_id("Col");

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sBombWalk;
sprDie = sBombDie;
sprHurt = sBombHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = BomberWander;
enemyScript[ENEMYSTATE.CHASE] = BomberChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = BomberHurt;
enemyScript[ENEMYSTATE.DIE] = BomberDie;
