event_inherited();

// To limt fireballs
if (AttackCooldown != 0) {
	AttackCooldown--;
}

// Below 50% hp increase difficulty
if (enemyHP < enemyMaxHP * 0.5 ) {
	if (PassiveCooldown != 0) {
		PassiveCooldown--;
	} else {
		PassiveCooldown = PassiveTimer;
		SlithersPassive();
	}
}

