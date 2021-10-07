state = PlayerStateFree;
stateAttack = AttackSlash;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 4.0;
speedRoll = 25.0;
distanceRoll = 200;

spriteRoll = sPlayerRoll
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;


