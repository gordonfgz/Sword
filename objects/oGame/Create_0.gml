randomize();

global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iLifted = noone;
global.playerHealthMax = 5;
global.playerHealth = global.playerHealthMax;

//global.iCamera = instance_create_layer(0,0,layer,oCamera);

global.iUI = instance_create_layer(0,0,layer,oUI);





room_goto(ROOM_START);

