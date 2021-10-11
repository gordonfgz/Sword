event_inherited();

//Instricsic variables
state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 3;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;


//Enemy Stats
timePassed = 0;
waitDuration = 60;
wait = 0;

//Enemy Sprites
sprIdle = sSkeleton
sprMove = sSkeletonRun1D;

//Enemy Scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;




