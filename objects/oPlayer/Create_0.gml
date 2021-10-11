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
distanceRoll = 150;

speedBonk = 1.5;
distanceBonk = 40;
distanceBonkHeight = 12;



z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

spriteRoll = sPlayerRoll
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

//added in lifting
animationEndScript = -1;


if (global.targetX != -1) {

	x = global.targetX;
	y = global.targetY
	direction = global.targetDirection;

}