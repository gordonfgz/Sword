event_inherited();

state = ENEMYSTATE.CHASE;

// Attack Speed Regulation
canAttack = false;
timer = 60;
timerResetValue = 100;

//Aura regulation
PassiveCooldown = 0;
PassiveTimer = 300;

//Enemy Sprites
sprMove = sWizardRun;
sprAttack = sWizardAttack;
sprDie = sWizardDeath;
sprHurt = sWizardHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.CHASE] = WizardChase;
enemyScript[ENEMYSTATE.ATTACK] = WizardAttack;
enemyScript[ENEMYSTATE.HURT] = WizardHurt;
enemyScript[ENEMYSTATE.DIE] = WizardDie;
