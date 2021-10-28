state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 4.0;

// Roll stuff
speedRoll = 6.0;
distanceRoll = 120;

// Bonk stuff
speedBonk = 1.5;
distanceBonk = 40;
distanceBonkHeight = 12;





z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

spriteRoll = sPlayerRoll

if (!stage2 && !stage3) {
	spriteIdle = sPlayer;
	spriteRun = sPlayerRun;
}

if (stage2 && !stage3) {
	spriteIdle = sPlayer2;
	spriteRun = sPlayerRunStage2;
}

if (stage2 && stage3) {
	spriteIdle = sPlayer3;
	spriteRun = sPlayerRunStage3;
}

localFrame = 0;

//added in lifting
animationEndScript = -1;


if (global.targetX != -1) {

	x = global.targetX;
	y = global.targetY
	direction = global.targetDirection;

}