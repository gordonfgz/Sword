state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 4.0;
speedRoll = 10.0;
distanceRoll = 100;

spriteRoll = sPlayerRoll
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;


